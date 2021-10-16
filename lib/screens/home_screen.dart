import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula1/bloc/news/news_bloc.dart';
import 'package:formula1/bloc/results/results_bloc.dart';
import 'package:formula1/components/bottom_bar.dart';
import 'package:formula1/screens/pages/home_page.dart';
import 'package:formula1/screens/pages/result_page.dart';

import '../constants.dart';

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

  int _currentIndex = 1;
  final List _children = [
    BlocProvider(
      create: (BuildContext context) => ResultsBloc(),
      child: ResultPage(),
    ),
    BlocProvider(
      create: (BuildContext context) => NewsBloc(),
      child: HomePage(),
    ),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        index: _currentIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
