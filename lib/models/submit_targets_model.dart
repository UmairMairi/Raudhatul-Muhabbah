// To parse this JSON data, do
//
//     final submitTargetModel = submitTargetModelFromJson(jsonString);

import 'dart:convert';

SubmitTargetModel submitTargetModelFromJson(String str) => SubmitTargetModel.fromJson(json.decode(str));

String submitTargetModelToJson(SubmitTargetModel data) => json.encode(data.toJson());

class SubmitTargetModel {
  final int? id;
  final String? createdBy;
  final DateTime? createdOn;
  final int? targetValue;
  final String? status;

  SubmitTargetModel({
    this.id,
    this.createdBy,
    this.createdOn,
    this.targetValue,
    this.status,
  });

  SubmitTargetModel copyWith({
    int? id,
    String? createdBy,
    DateTime? createdOn,
    int? targetValue,
    String? status,
  }) =>
      SubmitTargetModel(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdOn: createdOn ?? this.createdOn,
        targetValue: targetValue ?? this.targetValue,
        status: status ?? this.status,
      );

  factory SubmitTargetModel.fromJson(Map<String, dynamic> json) => SubmitTargetModel(
    id: json["id"],
    createdBy: json["created_by"],
    createdOn: json["created_on"] == null ? null : DateTime.parse(json["created_on"]),
    targetValue: json["target_value"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_by": createdBy,
    "created_on": createdOn?.toIso8601String(),
    "target_value": targetValue,
    "status": status,
  };
}
