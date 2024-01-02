// To parse this JSON data, do
//
//     final responseDataDesignDetail = responseDataDesignDetailFromJson(jsonString);

import 'dart:convert';

import 'respnse_data_design.dart';

ResponseDataDesignDetail responseDataDesignDetailFromJson(String str) =>
    ResponseDataDesignDetail.fromJson(json.decode(str));

String responseDataDesignDetailToJson(ResponseDataDesignDetail data) =>
    json.encode(data.toJson());

class ResponseDataDesignDetail {
  bool? status;
  String? message;
  List<DataDesign>? data;

  ResponseDataDesignDetail({
    this.status,
    this.message,
    this.data,
  });

  factory ResponseDataDesignDetail.fromJson(Map<String, dynamic> json) =>
      ResponseDataDesignDetail(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DataDesign>.from(
                json["data"]!.map((x) => DataDesign.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
