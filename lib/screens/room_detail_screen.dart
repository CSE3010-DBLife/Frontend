import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';

class RoomDetailScreen extends StatefulWidget {
  @override
  _RoomDetailScreenState createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTitle(title: '방 101호 상세정보'),
        ],
      ),
    );
  }
}
