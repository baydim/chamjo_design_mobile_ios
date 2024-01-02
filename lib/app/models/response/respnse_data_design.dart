// To parse this JSON data, do
//
//     final responseDataDesign = responseDataDesignFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

ResponseDataDesign responseDataDesignFromJson(String str) =>
    ResponseDataDesign.fromJson(json.decode(str));

String responseDataDesignToJson(ResponseDataDesign data) =>
    json.encode(data.toJson());

class ResponseDataDesign {
  bool? status;
  String? message;
  Data? data;

  ResponseDataDesign({
    this.status,
    this.message,
    this.data,
  });

  factory ResponseDataDesign.fromJson(Map<String, dynamic> json) =>
      ResponseDataDesign(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? page;
  int? totalData;
  List<DataDesign>? data;

  Data({
    this.page,
    this.totalData,
    this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        page: json["page"].toString(),
        totalData: json["totalData"],
        data: json["data"] == null
            ? []
            : List<DataDesign>.from(
                json["data"]!.map((x) => DataDesign.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "totalData": totalData,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataDesign {
  String? id;
  String? name;
  String? type;
  List<String>? category;
  List<ImageUrl>? imageUrl;
  bool? isCategory;
  String? provider;
  String? copyright;
  String? appstore;
  String? playstore;
  String? web;
  String? country;
  bool? lock;
  bool? DataDesignNew;
  String? contributor;
  String? newColor;
  String? color;

  DataDesign({
    this.id,
    this.name,
    this.type,
    this.category,
    this.imageUrl,
    this.isCategory,
    this.provider,
    this.copyright,
    this.appstore,
    this.playstore,
    this.web,
    this.country,
    this.lock,
    this.DataDesignNew,
    this.contributor,
    this.newColor,
    this.color,
  });

  factory DataDesign.fromJson(Map<String, dynamic> json) => DataDesign(
        id: json["_id"],
        name: json["name"],
        type: json["type"],
        category: json["category"] == null
            ? []
            : List<String>.from(json["category"]!.map((x) => x)),
        imageUrl: json["imageUrl"] == null
            ? []
            : List<ImageUrl>.from(
                json["imageUrl"]!.map((x) => ImageUrl.fromJson(x))),
        isCategory: json["isCategory"],
        provider: json["provider"],
        copyright: json["copyright"],
        appstore: json["appstore"],
        playstore: json["playstore"],
        web: json["web"],
        country: json["country"],
        lock: json["lock"],
        DataDesignNew: json["new"],
        contributor: json["contributor"],
        newColor: json["new_color"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "type": type,
        "category":
            category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "imageUrl": imageUrl == null
            ? []
            : List<dynamic>.from(imageUrl!.map((x) => x.toJson())),
        "isCategory": isCategory,
        "provider": provider,
        "copyright": copyright,
        "appstore": appstore,
        "playstore": playstore,
        "web": web,
        "country": country,
        "lock": lock,
        "new": DataDesignNew,
        "contributor": contributor,
        "new_color": newColor,
        "color": color,
      };
}

class ImageUrl {
  String? icon;
  String? card;
  List<Pattern>? pattern;

  ImageUrl({
    this.icon,
    this.card,
    this.pattern,
  });

  factory ImageUrl.fromJson(Map<String, dynamic> json) => ImageUrl(
        icon: json["icon"],
        card: json["card"],
        pattern: json["pattern"] == null
            ? []
            : List<Pattern>.from(
                json["pattern"]!.map((x) => Pattern.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "card": card,
        "pattern": pattern == null
            ? []
            : List<dynamic>.from(pattern!.map((x) => x.toJson())),
      };
}

class Pattern {
  int? id;
  String? name;

  Pattern({
    this.id,
    this.name,
  });

  factory Pattern.fromJson(Map<String, dynamic> json) => Pattern(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
