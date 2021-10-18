import 'dart:convert';

CircuitModel driverModelFromJson(String str) =>
    CircuitModel.fromJson(json.decode(str));

class CircuitModel {
  CircuitModel({
    required this.circuitId,
    required this.circuitName,
    required this.locality,
  });

  String circuitId;
  String circuitName;
  String locality;

  factory CircuitModel.fromJson(Map<String, dynamic> json) => CircuitModel(
        circuitId: json["circuitId"],
        circuitName: json["circuitName"],
        locality: json["Location"]["locality"],
      );
}
