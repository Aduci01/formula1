import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:formula1/components/home_header.dart';
import 'package:formula1/components/news_card.dart';
import 'package:formula1/models/news_model.dart';
import 'package:formula1/services/api_manager.dart';

import '../../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<NewsModel>> news;

  @override
  void initState() {
    news = ApiManager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Header(title: "Formula 1\nNews"),
          Expanded(
            child: Container(
              color: Colors.white,
              child: FutureBuilder<List<NewsModel>>(
                future: news,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var newsModel = snapshot.data![index];

                          return Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            height: 100,
                            child: Column(
                              children: [
                                NewsCard(news: newsModel, index: index),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          );
                        });
                  } else {
                    return const SpinKitChasingDots(
                      color: Colors.blueGrey,
                      size: 30,
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
