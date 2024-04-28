
// To parse this JSON data, do
//
//     final latestAchievementModel = latestAchievementModelFromJson(jsonString);

import 'dart:convert';

List<LatestAchievementModel> latestAchievementModelFromJson(String str) => List<LatestAchievementModel>.from(json.decode(str).map((x) => LatestAchievementModel.fromJson(x)));

String latestAchievementModelToJson(List<LatestAchievementModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LatestAchievementModel {
  final int? id;
  final String? createdBy;
  final int? targetValue;
  final int? achievementValue;
  final String? percentage;
  final DateTime? createdOn;
  final int? target;

  LatestAchievementModel({
    this.id,
    this.createdBy,
    this.targetValue,
    this.achievementValue,
    this.percentage,
    this.createdOn,
    this.target,
  });

  LatestAchievementModel copyWith({
    int? id,
    String? createdBy,
    int? targetValue,
    int? achievementValue,
    String? percentage,
    DateTime? createdOn,
    int? target,
  }) =>
      LatestAchievementModel(
        id: id ?? this.id,
        createdBy: createdBy ?? this.createdBy,
        targetValue: targetValue ?? this.targetValue,
        achievementValue: achievementValue ?? this.achievementValue,
        percentage: percentage ?? this.percentage,
        createdOn: createdOn ?? this.createdOn,
        target: target ?? this.target,
      );

  factory LatestAchievementModel.fromJson(Map<String, dynamic> json) => LatestAchievementModel(
    id: json["id"],
    createdBy: json["created_by"],
    targetValue: json["target_value"],
    achievementValue: json["achievement_value"],
    percentage: json["percentage"],
    createdOn: json["created_on"] == null ? null : DateTime.parse(json["created_on"]),
    target: json["target"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_by": createdBy,
    "target_value": targetValue,
    "achievement_value": achievementValue,
    "percentage": percentage,
    "created_on": createdOn?.toIso8601String(),
    "target": target,
  };
}
