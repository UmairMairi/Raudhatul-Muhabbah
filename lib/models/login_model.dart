// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String? key;
  final int? userId;

  LoginModel({
    this.key,
    this.userId,
  });

  LoginModel copyWith({
    String? key,
    int? userId,
  }) =>
      LoginModel(
        key: key ?? this.key,
        userId: userId ?? this.userId,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    key: json["key"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "user_id": userId,
  };
}
