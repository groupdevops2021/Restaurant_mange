// To parse this JSON data, do
//
//     final defaultModel = defaultModelFromJson(jsonString);

import 'dart:convert';

DefaultModel defaultModelFromJson(String str) =>
    DefaultModel.fromJson(json.decode(str));

String defaultModelToJson(DefaultModel data) => json.encode(data.toJson());

class DefaultModel {
  DefaultModel({
    this.success,
  });

  bool? success;

  factory DefaultModel.fromJson(Map<String, dynamic> json) => DefaultModel(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
