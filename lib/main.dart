import 'package:flutter/material.dart';
import 'package:formula1/screens/home_screen.dart';
import 'package:formula1/services/api_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formula 1',
      theme: ThemeData(fontFamily: 'Formula1'),
      home: HomeScreen(),
    );
  }
}
