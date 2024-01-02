// To parse this JSON data, do
//
//     final responseDataCategory = responseDataCategoryFromJson(jsonString);

import 'dart:convert';

ResponseDataCategory responseDataCategoryFromJson(String str) =>
    ResponseDataCategory.fromJson(json.decode(str));

String responseDataCategoryToJson(ResponseDataCategory data) =>
    json.encode(data.toJson());

class ResponseDataCategory {
  bool? status;
  String? message;
  List<Category>? data;

  ResponseDataCategory({
    this.status,
    this.message,
    this.data,
  });

  factory ResponseDataCategory.fromJson(Map<String, dynamic> json) =>
      ResponseDataCategory(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Category>.from(
                json["data"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Category {
  String? id;
  String? name;
  String? imageActive;
  String? imageInActive;
  bool? isNew;
  dynamic status;

  Category({
    this.id,
    this.name,
    this.imageActive,
    this.imageInActive,
    this.isNew,
    this.status,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        imageActive: json["imageActive"],
        imageInActive: json["imageInActive"],
        isNew: json["isNew"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "imageActive": imageActive,
        "imageInActive": imageInActive,
        "isNew": isNew,
        "status": status,
      };
}
