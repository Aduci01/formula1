import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formula1/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;

  const NewsCard({Key? key, required this.news}) : super(key: key);

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 85,
        child: ListTile(
          leading: Icon(Icons.library_books_outlined),
          title: Text(
            news.title,
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            news.description,
            style: const TextStyle(fontSize: 10),
          ),
          onTap: () => {_launchURL(news.url)},
          contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        ),
      ),
    );
  }
}
