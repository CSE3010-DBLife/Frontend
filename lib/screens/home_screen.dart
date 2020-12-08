import 'package:flutter/material.dart';
import 'package:hotel_management/screens/booking_screen.dart';
import 'package:hotel_management/screens/room_screen.dart';
import 'package:hotel_management/screens/parking_screen.dart';
import 'package:hotel_management/screens/employ_screen.dart';
import 'package:hotel_management/screens/setting_screen.dart';
import 'package:hotel_management/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    EmployScreen(),
    BookingScreen(),
    RoomScreen(),
    ParkingScreen(),
    SettingScreen(),
  ];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: Theme(
        data: darkThemeData.copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onTap,
          currentIndex: _currentIndex,
          items: [
            // ignore: deprecated_member_use
            new BottomNavigationBarItem(
              title: Padding(padding: EdgeInsets.all(0)),
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person_outline),
            ),
            // ignore: deprecated_member_use
            new BottomNavigationBarItem(
              title: Padding(padding: EdgeInsets.all(0)),
              icon: Icon(Icons.access_alarm),
              activeIcon: Icon(Icons.access_alarm),
            ),
            // ignore: deprecated_member_use
            new BottomNavigationBarItem(
              title: Padding(padding: EdgeInsets.all(0)),
              icon: Icon(Icons.king_bed_outlined),
              activeIcon: Icon(Icons.king_bed_outlined),
            ),
            // ignore: deprecated_member_use
            new BottomNavigationBarItem(
              title: Padding(padding: EdgeInsets.all(0)),
              icon: Icon(Icons.car_rental),
              activeIcon: Icon(Icons.car_rental),
            ),
            new BottomNavigationBarItem(
              title: Padding(padding: EdgeInsets.all(0)),
              icon: Icon(Icons.settings),
              activeIcon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
