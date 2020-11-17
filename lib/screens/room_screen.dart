import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/futurebuilders/room/summary_card_builder.dart';
import 'package:hotel_management/screens/room_detail_screen.dart';
import 'package:hotel_management/utilities/constants.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            CustomTitle(
              title: '객실 상태',
              searchIcon: Icon(Icons.search),
              searchIconOnPressed: () {},
            ),
            Row(
              children: [
                SummaryCardBuilder(),
                SizedBox(width: 16),
                SummaryCardBuilder(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
