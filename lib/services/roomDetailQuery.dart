import 'dart:async';
import 'package:hotel_management/models/room_detail.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class RoomDetailQuery {
  Future<RoomDetail> getRoomData(String roomId) async {
    String apiUrl = Api.url + "/show/room_status/detail/$roomId";
    RoomDetail roomDetail;
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _data = await networkHelper.getData();
      roomDetail = RoomDetail(
        id: roomId,
        status: _data['status'].toString(),
        duration: _data['duration'],
        cusName: _data['name'],
        cusPhoneNum: _data['phone'],
        cusParkNum: _data['car_id'],
        cusAddress: _data['full_address'],
        cusRequest: _data['request'],
        roomType: _data['room_detail_type'],
        roomPrice: _data['room_detail_price'].toString(),
        roomSize: _data['room_datail_size'].toString(),
        adultCount: _data['adults'].toString(),
        teenCount: _data['children'].toString(),
      );
    } on Error catch (e) {
      print(e.stackTrace);
    }
    return roomDetail;
  }
}
