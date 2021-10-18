import 'package:flutter/material.dart';
import 'package:formula1/constants.dart';

class BottomNavBar extends StatefulWidget {
  final int index;
  final ValueSetter<int> onTap;

  const BottomNavBar({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      backgroundColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined),
            label: "Rankings",
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "News",
          backgroundColor: Colors.black,
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/images/track.png")),
          label: "Races",
          backgroundColor: Colors.white,
        )
      ],
      currentIndex: widget.index,
      onTap: widget.onTap,
      selectedItemColor: Colors.red[800],
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: kSubTextStyle,
    );
  }
}
