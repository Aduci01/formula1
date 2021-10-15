import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

class NewsModel {
  NewsModel(
      {required this.title, required this.description, required this.url});

  String title;
  String description;
  String url;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        title: json["title"].replaceAll('â', ''),
        description: json["description"],
        url: json["link"],
      );
}
