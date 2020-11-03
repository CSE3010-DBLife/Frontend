import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';

class ParkingScreen extends StatefulWidget {
  @override
  _ParkingScreenState createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTitle(
            title: '주차 상태',
            searchIcon: Icon(Icons.search),
            searchIconOnPressed: () {},
          ),
        ],
      ),
    );
  }
}
