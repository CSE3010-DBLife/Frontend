import 'package:flutter/material.dart';
import 'package:hotel_management/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOTEL MANAGEMENT',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
