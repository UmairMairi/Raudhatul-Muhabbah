// To parse this JSON data, do
//
//     final achievementModel = achievementModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AchievementModel achievementModelFromJson(String str) => AchievementModel.fromJson(json.decode(str));

String achievementModelToJson(AchievementModel data) => json.encode(data.toJson());

class AchievementModel {
  final int id;
  final String createdBy;
  final int targetValue;
  final int achievementValue;
  final dynamic percentage;
  final DateTime createdOn;
  final int target;

  AchievementModel({
    required this.id,
    required this.createdBy,
    required this.targetValue,
    required this.achievementValue,
    required this.percentage,
    required this.createdOn,
    required this.target,
  });

  AchievementModel copyWith({
    int? id,
    String? createdBy,
    int? targetValue,
    int? achievementValue,
    dynamic percentage,
    DateTime? createdOn,
    int? target,
  }) =>
      AchievementModel(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        targetValue: targetValue ?? this.targetValue,
        achievementValue: achievementValue ?? this.achievementValue,
        percentage: percentage ?? this.percentage,
        createdOn: createdOn ?? this.createdOn,
        target: target ?? this.target,
      );

  factory AchievementModel.fromJson(Map<String, dynamic> json) => AchievementModel(
    id: json["id"],
    createdBy: json["created_by"],
    targetValue: json["target_value"],
    achievementValue: json["achievement_value"],
    percentage: json["percentage"],
    createdOn: DateTime.parse(json["created_on"]),
    target: json["target"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_by": createdBy,
    "target_value": targetValue,
    "achievement_value": achievementValue,
    "percentage": percentage,
    "created_on": createdOn.toIso8601String(),
    "target": target,
  };
}
