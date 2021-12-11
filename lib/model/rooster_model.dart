// To parse this JSON data, do
//
//     final roosterModel = roosterModelFromJson(jsonString);

import 'dart:convert';

List<RoosterModel> roosterModelFromJson(String str) => List<RoosterModel>.from(
    json.decode(str).map((x) => RoosterModel.fromJson(x)));

String roosterModelToJson(List<RoosterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoosterModel {
  RoosterModel({
    this.id,
    this.mm,
    this.mt,
    this.mw,
    this.mth,
    this.mf,
    this.nm,
    this.nt,
    this.nw,
    this.nth,
    this.nf,
    this.v,
  });

  String? id;
  String? mm;
  String? mt;
  String? mw;
  String? mth;
  String? mf;
  String? nm;
  String? nt;
  String? nw;
  String? nth;
  String? nf;
  int? v;

  factory RoosterModel.fromJson(Map<String, dynamic> json) => RoosterModel(
        id: json["_id"],
        mm: json["mm"],
        mt: json["mt"],
        mw: json["mw"],
        mth: json["mth"],
        mf: json["mf"],
        nm: json["nm"],
        nt: json["nt"],
        nw: json["nw"],
        nth: json["nth"],
        nf: json["nf"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "mm": mm,
        "mt": mt,
        "mw": mw,
        "mth": mth,
        "mf": mf,
        "nm": nm,
        "nt": nt,
        "nw": nw,
        "nth": nth,
        "nf": nf,
        "__v": v,
      };
}
