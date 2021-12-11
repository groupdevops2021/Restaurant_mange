// To parse this JSON data, do
//
//     final salaryModel = salaryModelFromJson(jsonString);

import 'dart:convert';

List<SalaryModel> salaryModelFromJson(String str) => List<SalaryModel>.from(
    json.decode(str).map((x) => SalaryModel.fromJson(x)));

String salaryModelToJson(List<SalaryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalaryModel {
  SalaryModel({
    this.id,
    this.name,
    this.emplid,
    this.salary,
    this.month,
    this.v,
  });

  String? id;
  String? name;
  String? emplid;
  String? salary;
  String? month;
  int? v;

  factory SalaryModel.fromJson(Map<String, dynamic> json) => SalaryModel(
        id: json["_id"],
        name: json["name"],
        emplid: json["emplid"],
        salary: json["salary"],
        month: json["month"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "emplid": emplid,
        "salary": salary,
        "month": month,
        "__v": v,
      };
}
