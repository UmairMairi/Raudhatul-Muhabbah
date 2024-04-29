// To parse this JSON data, do
//
//     final profileDetails = profileDetailsFromJson(jsonString);

import 'dart:convert';

ProfileDetails profileDetailsFromJson(String str) => ProfileDetails.fromJson(json.decode(str));

String profileDetailsToJson(ProfileDetails data) => json.encode(data.toJson());

class ProfileDetails {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final Profile? profile;

  ProfileDetails({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profile,
  });

  ProfileDetails copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    Profile? profile,
  }) =>
      ProfileDetails(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        profile: profile ?? this.profile,
      );

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "profile": profile?.toJson(),
  };
}

class Profile {
  final String? phoneNo;
  final String? pAddress;
  final DateTime? createdOn;
  final String? gender;

  Profile({
    this.phoneNo,
    this.pAddress,
    this.createdOn,
    this.gender,
  });

  Profile copyWith({
    String? phoneNo,
    String? pAddress,
    DateTime? createdOn,
    String? gender,
  }) =>
      Profile(
        phoneNo: phoneNo ?? this.phoneNo,
        pAddress: pAddress ?? this.pAddress,
        createdOn: createdOn ?? this.createdOn,
        gender: gender ?? this.gender,
      );

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    phoneNo: json["phone_no"],
    pAddress: json["p_address"],
    createdOn: json["created_on"] == null ? null : DateTime.parse(json["created_on"]),
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "phone_no": phoneNo,
    "p_address": pAddress,
    "created_on": createdOn?.toIso8601String(),
    "gender": gender,
  };
}
