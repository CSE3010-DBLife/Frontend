import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/futurebuilders/room/summary_card_builder.dart';

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
