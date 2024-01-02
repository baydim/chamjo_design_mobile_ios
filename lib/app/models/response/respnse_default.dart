import 'dart:convert';

String responseDefaultToJson(ResponseDefault data) =>
    json.encode(data.toJson());

ResponseDefault responseDefaultFromJson(String str) =>
    ResponseDefault.fromJson(json.decode(str));

class ResponseDefault {
  bool status = false;
  String? message = "Terjadi Kesalahan";
  dynamic data;

  ResponseDefault({
    this.status = false,
    this.message = "Terjadi Kesalahan",
    this.data,
  });

  ResponseDefault.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
