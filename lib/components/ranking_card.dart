import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:formula1/models/driver_ranking.dart';

import '../constants.dart';

class RankingCard extends StatelessWidget {
  final Result result;

  const RankingCard({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color teamColor = result.teamModel.getTeamColor();
    double containerHeight = 150;

    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              teamColor,
              teamColor.withAlpha(128),
            ],
          )),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Row(children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                  height: 45,
                  width: 60,
                  child: Image(
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Text(
                        result.teamModel.name,
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                    image: Image.asset("assets/images/logos/" +
                            result.teamModel.id +
                            ".png")
                        .image,
                  )),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 45,
                child: VerticalDivider(
                  color: Color.fromARGB(
                      255,
                      (teamColor.red * 1.2).toInt().clamp(0, 255),
                      (teamColor.green * 1.2).toInt().clamp(0, 255),
                      (teamColor.blue * 1.2).toInt().clamp(0, 255)),
                  thickness: 3,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  result.driverModel.givenName,
                  style: TextStyle(
                    fontSize: 12,
                    color: kTitleTextColor.withAlpha(200),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  result.driverModel.familyName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kTitleTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]),
            ]),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "#" + result.position.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: kTitleTextColor.withOpacity(0.9),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ]),
                Row(children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    result.points.toString() + " pts",
                    style: const TextStyle(
                      fontSize: 20,
                      color: kTitleTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ])
              ],
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: -20,
                    right: 100,
                    child: Text(
                      result.driverModel.permanentNumber.toString(),
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.w600,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = teamColor,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: containerHeight,
                      width: containerHeight,
                      child: Image(
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image(
                              image: Image.asset(
                                      "assets/images/drivers/missing.png")
                                  .image);
                        },
                        image: Image.asset("assets/images/drivers/" +
                                result.driverModel.driverId +
                                ".png")
                            .image,
                      )),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
