import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_loading.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/futurebuilders/room_detail/contact_card.dart';
import 'package:hotel_management/futurebuilders/room_detail/request_card.dart';
import 'package:hotel_management/futurebuilders/room_detail/detail_card.dart';
import 'package:hotel_management/futurebuilders/room_detail/member_card.dart';
import 'package:hotel_management/models/room_detail.dart';
import 'package:hotel_management/services/roomDetailQuery.dart';
import 'package:hotel_management/utilities/regWorker.dart';
import 'package:hotel_management/utilities/statusWorker.dart';

RoomDetailQuery _roomDetailQuery = RoomDetailQuery();

class RoomDetailCardBuilder extends StatelessWidget {
  RoomDetailCardBuilder(this.roomId, this.checkInDate, this.checkOutDate);
  final String roomId;
  final List<dynamic> checkInDate;
  final List<dynamic> checkOutDate;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<RoomDetail>(
        future: _roomDetailQuery.getRoomData(roomId, checkInDate, checkOutDate),
        builder: (context, AsyncSnapshot<RoomDetail> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return ReusableLoading();
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                '방 정보가 없습니다',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            );
          }

          final _data = snapshot.data;
          print(_data.status);
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    ReusableStatus(color: StatusWorker.getRoomStatusColor(_data.status)),
                    SizedBox(width: 25),
                    Text(
                      StatusWorker.getRoomStatus(_data.status),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
              ContactCard(
                cusName: _data.cusName ?? "오류",
                cusAddress: _data.cusAddress ?? "오류",
                cusParkNum: _data.cusParkNum ?? "오류",
                cusPhoneNum: RegWorker.getPhoneNumber(_data.cusPhoneNum) ?? "오류",
              ),
              SizedBox(height: 16.0),
              MemberCard(
                adultCount: _data.adultCount ?? "오류",
                teenCount: _data.teenCount ?? "오류",
              ),
              SizedBox(height: 16.0),
              DetailCard(
                roomInfo: _data.roomSize ?? "오류" + "/" + _data.roomType ?? "오류" + "/" + _data.roomPrice ?? "오류",
              ),
              SizedBox(height: 16.0),
              RequestCard(
                request: _data.roomRequest ?? "오류",
              ),
            ],
          );
        },
      ),
    );
  }
}
