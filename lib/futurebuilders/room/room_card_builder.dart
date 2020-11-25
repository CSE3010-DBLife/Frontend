import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/models/room.dart';
import 'package:hotel_management/screens/room_detail_screen.dart';
import 'package:hotel_management/services/roomQuery.dart';
import 'package:hotel_management/utilities/constants.dart';
import 'package:hotel_management/utilities/statusWorker.dart';

RoomQuery _roomQuery = RoomQuery();

class RoomCardBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Room>>(
        future: _roomQuery.getRoomData(),
        builder: (context, AsyncSnapshot<List<Room>> snapshot) {
          if (snapshot.data == null || snapshot.data.isEmpty) {
            return Center(
              child: Text(
                '방 정보가 없습니다',
                style: Theme.of(context).textTheme.subtitle1,
              ),
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
    );
  }
}

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
          return RoomDetailScreen(roomId: id);
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
                  child: ReusableStatus(color: StatusWorker.getRoomStatusColor(status)),
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
                    StatusWorker.getRoomStatus(status),
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
