import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formula1/components/bottom_bar.dart';
import 'package:formula1/screens/pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onBottomNavTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List _children = [
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        index: _currentIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
