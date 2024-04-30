// To parse this JSON data, do
//
//     final latestTargetsModel = latestTargetsModelFromJson(jsonString);

import 'dart:convert';

List<LatestTargetsModel> latestTargetsModelFromJson(String str) => List<LatestTargetsModel>.from(json.decode(str).map((x) => LatestTargetsModel.fromJson(x)));

String latestTargetsModelToJson(List<LatestTargetsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LatestTargetsModel {
  final int? id;
  final String? createdBy;
  final DateTime? createdOn;
  final int? targetValue;
  final String? status;

  LatestTargetsModel({
    this.id,
    this.createdBy,
    this.createdOn,
    this.targetValue,
    this.status,
  });

  LatestTargetsModel copyWith({
    int? id,
    String? createdBy,
    DateTime? createdOn,
    int? targetValue,
    String? status,
  }) =>
      LatestTargetsModel(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        createdOn: createdOn ?? this.createdOn,
        targetValue: targetValue ?? this.targetValue,
        status: status ?? this.status,
      );

  factory LatestTargetsModel.fromJson(Map<String, dynamic> json) => LatestTargetsModel(
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
