import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formula1/services/api_manager.dart';

import '../../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiManager().getNews();

    return Container(
      child: Column(
        children: [
          Image.asset("assets/images/f1_car.jpg"),
          Text(
            "Formula 1",
            textAlign: TextAlign.center,
            style: kHeadingTextStyle.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
