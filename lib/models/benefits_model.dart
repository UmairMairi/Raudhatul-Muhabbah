// To parse this JSON data, do
//
//     final benefitsModel = benefitsModelFromJson(jsonString);

import 'dart:convert';

List<BenefitsModel> benefitsModelFromJson(String str) => List<BenefitsModel>.from(json.decode(str).map((x) => BenefitsModel.fromJson(x)));

String benefitsModelToJson(List<BenefitsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BenefitsModel {
  final int? id;
  final String? createdBy;
  final String? status;
  final String? text;
  final DateTime? createdOn;

  BenefitsModel({
    this.id,
    this.createdBy,
    this.status,
    this.text,
    this.createdOn,
  });

  BenefitsModel copyWith({
    int? id,
    String? createdBy,
    String? status,
    String? text,
    DateTime? createdOn,
  }) =>
      BenefitsModel(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        status: status ?? this.status,
        text: text ?? this.text,
        createdOn: createdOn ?? this.createdOn,
      );

  factory BenefitsModel.fromJson(Map<String, dynamic> json) => BenefitsModel(
    id: json["id"],
    createdBy: json["created_by"],
    status: json["status"],
    text: json["text"],
    createdOn: json["created_on"] == null ? null : DateTime.parse(json["created_on"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_by": createdBy,
    "status": status,
    "text": text,
    "created_on": createdOn?.toIso8601String(),
  };
}
