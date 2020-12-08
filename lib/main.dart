import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hotel_management/screens/home_screen.dart';
import 'package:hotel_management/screens/login_screen.dart';
import 'package:hotel_management/utilities/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('ko', 'KR'), // Korean
      ],
      debugShowCheckedModeBanner: false,
      title: 'HOTEL MANAGEMENT',
      theme: darkThemeData,
      home: LoginScreen(),
    );
  }
}
