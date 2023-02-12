import 'package:sneakers/domain/entities/sneaker.dart';
// To parse this JSON data, do
//
//     final brand = brandFromJson(jsonString);

import 'dart:convert';

Brand brandFromJson(String str) => Brand.fromJson(json.decode(str));

String brandToJson(Brand data) => json.encode(data.toJson());

class Brand {
  Brand({
    required this.id,
    required this.name,
    this.featured,
    this.upcoming,
    this.newModels,
  });

  int? id;
  String? name;
  List<Sneaker>? featured;
  List<Sneaker>? upcoming;
  List<Sneaker>? newModels;

  List<Sneaker>? sneakersByType(SneakerType type) {
    switch (type) {
      case SneakerType.featured:
        return featured;
      case SneakerType.upcoming:
        return upcoming;
      case SneakerType.newModel:
        return newModels;
      default:
        return [];
    }
  }

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
      id: json["id"],
      name: json["name"],
      featured: List<Sneaker>.from(json["featured"].map((x) => Sneaker.fromJson(x))),
      upcoming: List<Sneaker>.from(json["upcoming"].map((x) => Sneaker.fromJson(x))),
      newModels: List<Sneaker>.from(json["new_models"].map((x) => Sneaker.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "featured": List<Sneaker>.from(featured!.map((x) => x)),
        "upcoming": List<Sneaker>.from(upcoming!.map((x) => x)),
        "new_models": List<Sneaker>.from(newModels!.map((x) => x)),
      };
}
