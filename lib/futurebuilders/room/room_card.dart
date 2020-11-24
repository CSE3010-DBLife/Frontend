import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/screens/room_detail_screen.dart';
import 'package:hotel_management/utilities/constants.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    this.id,
    this.status,
  });
  final String id;
  final String status;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RoomDetailScreen();
        }));
      },
      child: ReusableCard(
        decoration: cardDecoration,
        cardChild: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: cardInnerDecoration,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    '방 ${id}호',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: ReusableStatus(color: statusGreen),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 16.0, 8.0),
                  child: Text(
                    getRoomStatus(status),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String getRoomStatus(String status) {
  if (status == "0")
    return "예약 가능";
  else if (status == "1")
    return "예약 됨";
  else if (status == "2")
    return "사용 중";
  else if (status == "3")
    return "외출 중";
  else
    return "오류";
}
