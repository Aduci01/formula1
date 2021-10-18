import 'dart:convert';

DriverModel driverModelFromJson(String str) =>
    DriverModel.fromJson(json.decode(str));

class DriverModel {
  DriverModel(
      {required this.driverId,
      required this.givenName,
      required this.familyName,
      required this.nationality,
      required this.permanentNumber});

  String driverId;
  String givenName;
  String familyName;
  String nationality;
  int permanentNumber;

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        driverId: json["driverId"],
        givenName: json["givenName"],
        familyName: json["familyName"],
        nationality: json["nationality"],
        permanentNumber: int.parse(
            json.keys.contains("permanentNumber") == false
                ? "0"
                : json["permanentNumber"]),
      );

  Map<String, dynamic> toJson() => {
        "driverId": driverId,
        "givenName": givenName,
        "familyName": familyName,
        "nationality": nationality,
        "permanentNumber": permanentNumber,
      };
}
