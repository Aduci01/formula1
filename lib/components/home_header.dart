import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.35;

    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(color: kBackgroundColor),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: kHeadingTextStyle.copyWith(color: Colors.white),
            ),
            Row(children: [
              Image.asset(
                "assets/images/f1_car.jpg",
                height: height - 15,
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
