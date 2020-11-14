import 'package:flutter/material.dart';
import 'package:hotel_management/screens/home_screen.dart';
import 'package:hotel_management/utilities/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HOTEL MANAGEMENT',
      theme: darkThemeData,
      home: HomeScreen(),
    );
  }
}
