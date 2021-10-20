import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formula1/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  final int index;

  final List<Color> colors = [const Color(0xFF002B3D)];

  NewsCard({Key? key, required this.news, required this.index})
      : super(key: key);

  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colors[index % colors.length],
      elevation: 4,
      shadowColor: Colors.grey,
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), bottomRight: Radius.circular(18))),
      child: SizedBox(
        height: 86,
        child: ListTile(
          leading: SizedBox(
            width: 70,
            height: 60,
            child: Row(
              children: [
                Icon(Icons.library_books_outlined,
                    color: Colors.white.withOpacity(0.9)),
                const SizedBox(width: 12),
                const VerticalDivider(
                  color: Colors.white,
                  thickness: 1.5,
                ),
              ],
            ),
          ),
          title: Text(
            news.title,
            style: TextStyle(color: Colors.white.withOpacity(0.8)),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white70,
          ),
          onTap: () => {_launchURL(news.url)},
          contentPadding: const EdgeInsets.all(8),
        ),
      ),
    );
  }
}
