// To parse this JSON data, do
//
//     final profileDetails = profileDetailsFromJson(jsonString);

import 'dart:convert';

ProfileDetails profileDetailsFromJson(String str) => ProfileDetails.fromJson(json.decode(str));

String profileDetailsToJson(ProfileDetails data) => json.encode(data.toJson());

class ProfileDetails {
  final int? id;
  final String? names;
  final String? email;
  final List<String>? roles;

  ProfileDetails({
    this.id,
    this.names,
    this.email,
    this.roles,
  });

  ProfileDetails copyWith({
    int? id,
    String? names,
    String? email,
    List<String>? roles,
  }) =>
      ProfileDetails(
        id: id ?? this.id,
        names: names ?? this.names,
        email: email ?? this.email,
        roles: roles ?? this.roles,
      );

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
    id: json["id"],
    names: json["names"],
    email: json["email"],
    roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "names": names,
    "email": email,
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
  };
}
