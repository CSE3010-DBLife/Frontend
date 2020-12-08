import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_button.dart';
import 'package:hotel_management/screens/login_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitle(title: '로그인 설정'),
        ReusableButton(
          title: '로그아웃',
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        ),
      ],
    );
  }
}
