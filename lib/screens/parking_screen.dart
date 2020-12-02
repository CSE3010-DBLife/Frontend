import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/futurebuilders/parking/parking_card_builder.dart';

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
            title: '주차 관리',
            searchIcon: Icon(Icons.search),
            searchIconOnPressed: () {},
          ),
          ParkingCardBuilder()
        ],
      ),
    );
  }
}
