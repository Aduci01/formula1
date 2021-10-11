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
          SizedBox(
            height: 11,
            child: VerticalDivider(
              color: teamColor,
              thickness: 3,
            ),
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
            SizedBox(
                height: 25,
                width: 25,
                child: Image(
                  image: Image.asset(
                          "assets/images/logos/" + result.teamModel.id + ".png")
                      .image,
                  height: 25,
                  width: 25,
                )),
            const SizedBox(
              width: 12,
            ),
            SizedBox(
              height: 21,
              child: VerticalDivider(
                color: teamColor,
                thickness: 4,
              ),
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
