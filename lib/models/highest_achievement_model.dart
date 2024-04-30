// To parse this JSON data, do
//
//     final highestAchieverModel = highestAchieverModelFromJson(jsonString);

import 'dart:convert';

HighestAchieverModel highestAchieverModelFromJson(String str) => HighestAchieverModel.fromJson(json.decode(str));

String highestAchieverModelToJson(HighestAchieverModel data) => json.encode(data.toJson());

class HighestAchieverModel {
  final int? id;
  final String? userPhone;
  final bool? perce;
  final String? createdBy;
  final DateTime? createdOn;
  final int? targetValue;
  final int? achievementValue;
  final int? target;
  final int? achievement;
  final dynamic percentage;

  HighestAchieverModel({
    this.id,
    this.userPhone,
    this.perce,
    this.createdBy,
    this.createdOn,
    this.targetValue,
    this.achievementValue,
    this.target,
    this.achievement,
    this.percentage,
  });

  HighestAchieverModel copyWith({
    int? id,
    String? userPhone,
    bool? perce,
    String? createdBy,
    DateTime? createdOn,
    int? targetValue,
    int? achievementValue,
    int? target,
    int? achievement,
    dynamic percentage,
  }) =>
      HighestAchieverModel(
        id: id ?? this.id,
        userPhone: userPhone ?? this.userPhone,
        perce: perce ?? this.perce,
        createdBy: createdBy ?? this.createdBy,
        createdOn: createdOn ?? this.createdOn,
        targetValue: targetValue ?? this.targetValue,
        achievementValue: achievementValue ?? this.achievementValue,
        target: target ?? this.target,
        achievement: achievement ?? this.achievement,
        percentage: percentage ?? this.percentage,
      );

  factory HighestAchieverModel.fromJson(Map<String, dynamic> json) => HighestAchieverModel(
    id: json["id"],
    userPhone: json["user_phone"],
    perce: json["perce"],
    createdBy: json["created_by"],
    createdOn: json["created_on"] == null ? null : DateTime.parse(json["created_on"]),
    targetValue: json["target_value"],
    achievementValue: json["achievement_value"],
    target: json["target"],
    achievement: json["achievement"],
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_phone": userPhone,
    "perce": perce,
    "created_by": createdBy,
    "created_on": createdOn?.toIso8601String(),
    "target_value": targetValue,
    "achievement_value": achievementValue,
    "target": target,
    "achievement": achievement,
    "percentage": percentage,
  };
}
