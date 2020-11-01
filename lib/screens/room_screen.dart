import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTitle(
            title: '객실 상태',
            searchIcon: Icon(Icons.search),
            searchIconOnPressed: () {},
          ),
        ],
      ),
    );
  }
}
