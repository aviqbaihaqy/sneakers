import 'dart:convert';

// To parse this JSON data, do
// final asset = assetFromJson(jsonString);

Asset assetFromJson(String str) => Asset.fromJson(json.decode(str));

String assetToJson(Asset data) => json.encode(data.toJson());

class Asset {
  Asset({
    required this.type,
    required this.path,
  });

  String path;
  AssetType type;

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        path: json["path"],
        type: AssetType.values.byName(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "type": type,
      };
}

enum AssetType {
  picture,
  video,
}

extension AssetTypeExt on AssetType {
  String get name {
    switch (this) {
      case AssetType.picture:
        return 'picture';
      case AssetType.video:
        return 'video';
      default:
        return '';
    }
  }
}
