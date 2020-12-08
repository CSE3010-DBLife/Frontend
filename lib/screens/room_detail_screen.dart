import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_back.dart';
import 'package:hotel_management/futurebuilders/room_detail/room_detail_card_builder.dart';

class RoomDetailScreen extends StatefulWidget {
  RoomDetailScreen({this.roomId, this.checkInDate, this.checkOutDate});
  final String roomId;
  final List<dynamic> checkInDate;
  final List<dynamic> checkOutDate;
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
            ReusableBack(),
            CustomTitle(title: '방 ${widget.roomId}호 상세정보'),
            RoomDetailCardBuilder(widget.roomId, widget.checkInDate, widget.checkOutDate),
          ],
        ),
      ),
    );
  }
}
