import 'dart:async';
import 'package:hotel_management/models/room_detail.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class RoomDetailQuery {
  Future<RoomDetail> getRoomData(String roomId, List<dynamic> checkInDate, List<dynamic> checkOutDate) async {
    String _checkInDate = checkInDate[0].toString() + "-" + checkInDate[1].toString() + "-" + checkInDate[2];
    String _checkOutDate = checkOutDate[0].toString() + "-" + checkOutDate[1].toString() + "-" + checkOutDate[2];
    String apiUrl = Api.url + "/show/room_status/detail/$roomId/$_checkInDate/$_checkOutDate";
    print(apiUrl);
    RoomDetail roomDetail;
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _data = await networkHelper.getData();
      roomDetail = RoomDetail(
        id: roomId,
        status: _data['reservation_status'].toString(),
        duration: _data['duration'],
        cusName: _data['name'],
        cusPhoneNum: _data['phone'],
        cusParkNum: _data['car_id'] == "no_car" ? "차량 없음" : _data["car_id"],
        cusAddress: _data['roadAddr'] + " " + _data['detailAddr'],
        cusRequest: _data['request'],
        roomType: _data['room_detail_type'],
        roomPrice: _data['room_detail_price'].toString(),
        roomSize: _data['room_datail_size'].toString(),
        adultCount: _data['adults'].toString(),
        teenCount: _data['children'].toString(),
        roomRequest: _data['request'] ?? "요청사항 없음",
      );
    } on Error catch (e) {
      print(e.stackTrace);
    }
    return roomDetail;
  }
}
