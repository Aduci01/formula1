import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';

TeamModel driverModelFromJson(String str) =>
    TeamModel.fromJson(json.decode(str));

class TeamModel {
  TeamModel({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  String id;
  String name;
  String logoUrl;

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        id: json["constructorId"],
        name: json["name"],
        logoUrl: json["url"],
      );

  Color getTeamColor() {
    Map<String, Color?> teamColors = {
      "mercedes": Color(0xFF00CFBA),
      "ferrari": Color(0xFFC30000),
      "red_bull": Color(0xFF00007D),
      "racing_point": Colors.pink[200],
      "renault": Color(0xFFFFD800),
      "mclaren": Color(0xFFFF8700),
      "alphatauri": Color(0xFF2B4562),
      "alfa": Color(0xFF900000),
      "haas": Color(0xFFFFFFFF),
      "williams": Color(0xFF005AFF),
      "alpine": Color(0xFF00CFBA),
      "force_india": Colors.pink[200],
      "lotus_f1": Color(0xFFFFB800),
      "toro_rosso": Color(0xFF0000FF),
      "sauber": Color(0xFF006EFF),
      "manor": Color(0xFFAAFFFF),
    };

    return teamColors[id] ?? Colors.white;
  }
}
