import 'package:flutter/material.dart';

ThemeData darkThemeData = ThemeData(
  scaffoldBackgroundColor: Color(0xFF121212),
  textTheme: TextTheme(
    subtitle1: TextStyle(color: Color(0xFFE7E7E7), fontSize: 15, fontFamily: 'Godo-M'),
    subtitle2: TextStyle(color: Color(0xFFD1D1D1), fontSize: 10, fontFamily: 'Godo-M'),
    headline6: TextStyle(color: Color(0xFFE7E7E7), fontSize: 20, fontFamily: 'Godo-M'),
  ),
  iconTheme: IconThemeData(color: Color(0xFFE7E7E7)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF181818),
      selectedIconTheme: IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(color: Color(0xFFD1D1D1))),
);

Color statusRed = Color(0xFFE65F3F);
Color statusGreen = Color(0xFF04CF5B);
Color statusOrange = Color(0xFFFDBC00);
Color statusGrey = Color(0xFFD1D1D1);

BoxDecoration cardDecoration = BoxDecoration(
  color: Color(0xFF202020),
  borderRadius: BorderRadius.circular(8.0),
);

BoxDecoration cardInnerDecoration = BoxDecoration(
  color: Color(0xFF141414),
  borderRadius: BorderRadius.circular(18.0),
);

BoxDecoration buttonDecoration = BoxDecoration(
  color: Color(0xFF202020),
  borderRadius: BorderRadius.circular(8.0),
);
