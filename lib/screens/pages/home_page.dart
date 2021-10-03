import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset("assets/images/f1_car.jpg"),
          Text(
            "Formula 1",
            textAlign: TextAlign.center,
            style: kTitleTextstyle.copyWith(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
