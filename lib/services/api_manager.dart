import 'dart:convert';

import 'package:formula1/models/driver_ranking.dart';
import 'package:formula1/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

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

  Future<String> getNews() async {
    var client = http.Client();
    var news;

    String url =
        "https://www.formula1.com/content/fom-website/en/latest/all.xml";

    try {
      var response = await http.get(Uri.parse(url));

      print(response.body);

      if (response.statusCode == 200) {
        final Xml2Json xml2Json = Xml2Json();

        xml2Json.parse(response.body);
        var jsonString = xml2Json.toParker();

        var data = jsonDecode(jsonString);
        var items = data["rss"]["channel"]["item"];

        news = List<NewsModel>.from(items.map((x) => NewsModel.fromJson(x)));
      }
    } on Exception {
      return "news";
    }

    return "news";
  }
}
