import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/futurebuilders/room_detail/room_detail_card_builder.dart';
import 'package:hotel_management/screens/request_screen.dart';

class RoomDetailScreen extends StatefulWidget {
  RoomDetailScreen({this.roomId});
  final String roomId;
  @override
  _RoomDetailScreenState createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTitle(title: '방 ${widget.roomId}호 상세정보'),
              RoomDetailCardBuilder(widget.roomId),
            ],
          ),
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
