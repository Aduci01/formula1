import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formula1/models/driver_ranking.dart';

import '../constants.dart';

class RankingCard extends StatelessWidget {
  final Result result;

  const RankingCard({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color teamColor = result.teamModel.getTeamColor();

    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Text(
            "#" + result.position.toString(),
            style: const TextStyle(
              fontSize: 12,
              color: kTitleTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            height: 10,
            child: DecoratedBox(
                decoration: BoxDecoration(
              color: teamColor,
              shape: BoxShape.rectangle,
              border: Border.all(width: 1.25, color: teamColor),
            )),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            result.points.toString() + "pts",
            style: const TextStyle(
              fontSize: 12,
              color: kTextLightColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ]),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.ac_unit,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              height: 20,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                color: teamColor,
                shape: BoxShape.rectangle,
                border: Border.all(width: 2, color: teamColor),
              )),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              result.driverModel.givenName +
                  " " +
                  result.driverModel.familyName,
              style: const TextStyle(
                fontSize: 16,
                color: kTitleTextColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
