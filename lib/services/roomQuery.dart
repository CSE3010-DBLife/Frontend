import 'dart:async';

import 'package:hotel_management/models/room.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class RoomQuery {
  String apiUrl = Api.url + "/show/room_status";
  Future<List<Room>> getRoomData() async {
    List<Room> roomList = [];
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _data = await networkHelper.getData();
      List<dynamic> _roomObjects = _data;

      _roomObjects.forEach((_room) {
        var room = Room(id: _room['room_id'].toString(), status: _room['room_status'].toString());
        roomList.add(room);
      });
    } on Error catch (e) {
      print('Error: $e');
    }
    return roomList;
  }
}
