import 'dart:convert';

ProfileDetails? profileDetailsFromJson(String str) =>
    ProfileDetails.fromJson(json.decode(str));

String profileDetailsToJson(ProfileDetails? data) =>
    json.encode(data!.toJson());

class ProfileDetails {
  ProfileDetails({
    required this.userEmail,
    required this.name,
    required this.affiliation,
    required this.experienceInThisField,
    required this.numberOfCapsulesRead,
  });
  String userEmail;
  String name;
  String affiliation;
  String experienceInThisField;
  String numberOfCapsulesRead;

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
        userEmail: json["email"],
        name: json["name"],
        affiliation: json["affiliation"],
        experienceInThisField: json["experience in this field"],
        numberOfCapsulesRead: json["number of capsules read"],
      );

  Map<String, dynamic> toJson() => {
        "userEmail": userEmail,
        "name": name,
        "affiliation": affiliation,
        "experience in this field": experienceInThisField,
        "number of capsules read": numberOfCapsulesRead,
      };
}
