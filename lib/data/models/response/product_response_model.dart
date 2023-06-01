// To parse this JSON data, do
//
//     final productResponseModel = productResponseModelFromJson(jsonString);

// create success
// {
//     "title": "New Product",
//     "price": 10,
//     "description": "A description",
//     "images": [
//         "https://placeimg.com/640/480/any"
//     ],
//     "category": {
//         "id": 1,
//         "name": "Clothes",
//         "image": "https://picsum.photos/640/640?r=5675",
//         "creationAt": "2023-06-01T00:38:10.000Z",
//         "updatedAt": "2023-06-01T00:38:10.000Z"
//     },
//     "id": 226,
//     "creationAt": "2023-06-01T14:02:58.000Z",
//     "updatedAt": "2023-06-01T14:02:58.000Z"
// }

import 'dart:convert';

class ProductResponseModel {
  String? title;
  int? price;
  String? description;
  List<String>? images;
  Category? category;
  int? id;
  DateTime? creationAt;
  DateTime? updatedAt;

  ProductResponseModel({
    this.title,
    this.price,
    this.description,
    this.images,
    this.category,
    this.id,
    this.creationAt,
    this.updatedAt,
  });

  factory ProductResponseModel.fromRawJson(String str) =>
      ProductResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        id: json["id"],
        creationAt: json["creationAt"] == null
            ? null
            : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "category": category?.toJson(),
        "id": id,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Category {
  int? id;
  String? name;
  String? image;
  DateTime? creationAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: json["creationAt"] == null
            ? null
            : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
