import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/futurebuilders/room_detail/detail_card_builder.dart';
import 'package:hotel_management/futurebuilders/room_detail/contact_card_builder.dart';
import 'package:hotel_management/futurebuilders/room_detail/member_card_builder.dart';
import 'package:hotel_management/screens/request_screen.dart';
import 'package:hotel_management/utilities/constants.dart';

class RoomDetailScreen extends StatefulWidget {
  @override
  _RoomDetailScreenState createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTitle(title: '방 101호 상세정보'),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  ReusableStatus(color: statusRed),
                  SizedBox(width: 25),
                  Text(
                    '사용중',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            ContactCardBuilder(),
            SizedBox(height: 16),
            MemberCardBuilder(),
            SizedBox(height: 16.0),
            DetailCardBuilder()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
          child: Icon(Icons.message),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RequestScreen();
            },
          ),
        ),
      ),
    );
  }
}
