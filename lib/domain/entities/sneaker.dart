import 'dart:ui';

import 'package:sneakers/core/theme/colors.dart';
import 'package:sneakers/domain/entities/asset.dart';

// To parse this JSON data, do
//
//     final sneaker = sneakerFromJson(jsonString);

import 'dart:convert';

Sneaker sneakerFromJson(String str) => Sneaker.fromJson(json.decode(str));

String sneakerToJson(Sneaker data) => json.encode(data.toJson());

class Sneaker {
  Sneaker({
    required this.id,
    required this.shortName,
    required this.name,
    required this.price,
    required this.assets,
    required this.color,
    required this.description,
    required this.sizes,
    required this.type,
    required this.brandName,
    // required this.brandId,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String shortName;
  String name;
  int price;
  List<Asset> assets;
  Color color;
  String description;
  List<int> sizes;
  String brandName;
  SneakerType type;
  // int brandId;
  // DateTime createdAt;
  // DateTime updatedAt;

  String get priceAsCurrency => price.toString(); //price!.toCurrency();

  String get image => assets[0].path;

  Color get estimatedColor => color.estimate();

  factory Sneaker.fromJson(Map<String, dynamic> json) => Sneaker(
        id: json["id"],
        shortName: json["shortName"],
        name: json["name"],
        price: json["price"],
        assets: List<Asset>.from(json["assets"].map((x) => Asset.fromJson(x))),
        color: colorConvert(json["color"]),
        description: json["description"],
        sizes: List<int>.from(json["sizes"].map((x) => x)),
        type: SneakerType.values.byName(json["type"]),
        brandName: json["brand_name"],
        // brandId: json["brand_id"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shortName": shortName,
        "name": name,
        "price": price,
        "assets": List<Asset>.from(assets.map((x) => x.toJson())),
        "color": color,
        "description": description,
        "sizes": List<int>.from(sizes.map((x) => x)),
        "type": type,
        "brand_name": brandName,
        // "brand_id": brandId,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
      };
}

enum SneakerType {
  upcoming,
  featured,
  newModel,
  other,
}

extension SneakerTypeExt on SneakerType {
  String get name {
    switch (this) {
      case SneakerType.upcoming:
        return 'Upcoming';
      case SneakerType.featured:
        return 'Featured';
      case SneakerType.newModel:
        return 'New';
      default:
        return 'Other';
    }
  }
}

colorConvert(String color) {
  color = color.replaceAll("#", "");
  if (color.length == 6) {
    return Color(int.parse("0xFF$color"));
  } else if (color.length == 8) {
    return Color(int.parse("0x$color"));
  }
}
