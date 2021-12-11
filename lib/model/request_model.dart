// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'dart:convert';

List<RequestModel> requestModelFromJson(String str) => List<RequestModel>.from(
    json.decode(str).map((x) => RequestModel.fromJson(x)));

String requestModelToJson(List<RequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestModel {
  RequestModel({
    this.id,
    this.emplid,
    this.cat,
    this.msg,
    this.v,
  });

  String? id;
  String? emplid;
  String? cat;
  String? msg;
  int? v;

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        id: json["_id"],
        emplid: json["emplid"],
        cat: json["cat"],
        msg: json["msg"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "emplid": emplid,
        "cat": cat,
        "msg": msg,
        "__v": v,
      };
}
