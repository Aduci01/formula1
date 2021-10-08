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
      backgroundColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined), label: "Rankings"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/track.png")),
            label: "Races"),
      ],
      currentIndex: widget.index,
      onTap: widget.onTap,
      selectedItemColor: Colors.red[800],
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: kSubTextStyle,
    );
  }
}
