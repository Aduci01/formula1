import 'dart:convert';

import 'package:formula1/models/driver_ranking.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class ApiManager {
  Future<List<Result>> getResults(int year) async {
    var client = http.Client();
    var results;

    String url = "http://ergast.com/api/f1/$year/driverStandings.json";

    try {
      var response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        var mrdata = jsonMap["MRData"];
        var standingTable = mrdata["StandingsTable"];
        var standingLists = standingTable["StandingsLists"];

        results = List<Result>.from(
            standingLists[0]["DriverStandings"].map((x) => Result.fromJson(x)));
      }
    } on Exception {
      return results;
    }

    return results;
  }
}
