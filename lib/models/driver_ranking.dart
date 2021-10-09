import 'dart:convert';

import 'package:formula1/models/driver_model.dart';
import 'package:formula1/models/team_model.dart';

Result driverModelFromJson(String str) => Result.fromJson(json.decode(str));

class Result {
  Result(
      {required this.points,
      required this.position,
      required this.wins,
      required this.driverModel,
      required this.teamModel});

  int position;
  int points;
  int wins;

  DriverModel driverModel;
  TeamModel teamModel;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      position: int.parse(json["position"]),
      points: int.parse(json["points"]),
      wins: int.parse(json["wins"]),
      driverModel: DriverModel.fromJson(json["Driver"]),
      teamModel: TeamModel.fromJson(json["Constructors"][0]));
}
