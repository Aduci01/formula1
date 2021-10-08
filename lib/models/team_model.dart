import 'dart:convert';

TeamModel driverModelFromJson(String str) =>
    TeamModel.fromJson(json.decode(str));

class TeamModel {
  TeamModel({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  int id;
  String name;
  String logoUrl;

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        id: json["id"],
        name: json["name"],
        logoUrl: json["logo"],
      );
}
