import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/futurebuilders/room/room_card.dart';
import 'package:hotel_management/models/room.dart';
import 'package:hotel_management/services/roomQuery.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  RoomQuery _roomQuery = RoomQuery();
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
          Expanded(
            child: FutureBuilder<List<Room>>(
              future: _roomQuery.getRoomData(),
              builder: (context, AsyncSnapshot<List<Room>> snapshot) {
                if (snapshot.data == null || snapshot.data.isEmpty) {
                  return Center(
                    child: Text('방 정보가 없습니다'),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        RoomCard(
                          id: snapshot.data[index].id ?? "오류",
                          status: snapshot.data[index].status ?? "오류",
                        ),
                        SizedBox(height: 16),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
