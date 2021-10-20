import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:formula1/bloc/news/news_bloc.dart';
import 'package:formula1/components/home_header.dart';
import 'package:formula1/components/news_card.dart';
import 'package:formula1/models/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<NewsModel>> news;

  @override
  void initState() {
    super.initState();

    context.read<NewsBloc>().add(GetNewsList());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(children: [
          const Header(title: "News"),
          Expanded(
              child: Container(
            color: Colors.white,
            child: BlocConsumer<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoaded) {
                  return ListView.builder(
                      itemCount: state.model.length,
                      itemBuilder: (context, index) {
                        var newsModel = state.model[index];

                        return Container(
                          margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
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
              listener: (context, state) {},
            ),
          ))
        ]));
  }
}
