import 'package:flutter/material.dart';

ThemeData darkThemeData = ThemeData(
  scaffoldBackgroundColor: Color(0xFF121212),
  textTheme: TextTheme(
    subtitle2: TextStyle(color: Color(0xFFD1D1D1), fontSize: 10, fontFamily: 'Godo-M'),
    headline6: TextStyle(color: Color(0xFFE7E7E7), fontSize: 20, fontFamily: 'Godo-M'),
  ),
  iconTheme: IconThemeData(color: Color(0xFFE7E7E7)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF181818),
      selectedIconTheme: IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Color(0xFFD1D1D1))),
);
