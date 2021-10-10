import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:formula1/components/ranking_card.dart';
import 'package:formula1/models/driver_ranking.dart';
import 'package:formula1/services/api_manager.dart';

import '../../constants.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late Future<List<Result>> results;

  @override
  void initState() {
    results = ApiManager().getResults(2020);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: FutureBuilder<List<Result>>(
          future: results,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var ranking = snapshot.data![index];

                    return Container(
                      height: 85,
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          RankingCard(
                            result: ranking,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            indent: 30,
                            endIndent: 75,
                            color: Colors.white.withAlpha(64),
                            thickness: 0.4,
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const SpinKitFadingCircle(
                color: Colors.white,
                size: 70,
              );
            }
          },
        ),
      ),
    );
  }
}
