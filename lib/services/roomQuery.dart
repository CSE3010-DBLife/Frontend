import 'dart:async';

import 'package:hotel_management/models/room.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class RoomQuery {
  Future<List<Room>> getRoomData() async {
    String apiUrl = Api.url + "/show/room_status";
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

  Future<List<Room>> getRoomFilteredData({List<bool> buttons, DateTime checkInDate, DateTime checkOutDate, int roomId}) async {
    String _convertMonthOrDay(String input) {
      return input.length == 1 ? "0" + input : input;
    }

    String _checkInDate = checkInDate.year.toString() + "-" + _convertMonthOrDay(checkInDate.month.toString()) + "-" + _convertMonthOrDay(checkInDate.day.toString());
    String _checkOutDate = checkOutDate.year.toString() + "-" + _convertMonthOrDay(checkOutDate.month.toString()) + "-" + _convertMonthOrDay(checkOutDate.day.toString());

    String apiUrl = Api.url + "/show/reservation_status/" + _checkInDate + "/" + _checkOutDate;
    print(apiUrl);
    List<Room> roomList = [];
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _data = await networkHelper.getData();
      if (roomId != null) {
        _data.forEach((_room) {
          if (roomId == _room['room_id']) {
            if (buttons[0]) {
              var room = Room(
                id: _room['room_id'].toString(),
                status: _room['reservation_status'].toString(),
                checkInDate: _room['check_in_date'],
                checkOutDate: _room['check_out_date'],
              );
              roomList.add(room);
            } else if (buttons[1]) {
              if (_room['reservation_status'] == 0) {
                var room = Room(
                  id: _room['room_id'].toString(),
                  status: _room['reservation_status'].toString(),
                  checkInDate: _room['check_in_date'],
                  checkOutDate: _room['check_out_date'],
                );
                roomList.add(room);
              }
            } else if (buttons[2]) {
              if (_room['reservation_status'] == 1) {
                var room = Room(
                  id: _room['room_id'].toString(),
                  status: _room['reservation_status'].toString(),
                  checkInDate: _room['check_in_date'],
                  checkOutDate: _room['check_out_date'],
                );
                roomList.add(room);
              }
            }
          }
        });
      } else {
        _data.forEach((_room) {
          if (buttons[0]) {
            var room = Room(
              id: _room['room_id'].toString(),
              status: _room['reservation_status'].toString(),
              checkInDate: _room['check_in_date'],
              checkOutDate: _room['check_out_date'],
            );
            roomList.add(room);
          } else if (buttons[1]) {
            if (_room['reservation_status'] == 0) {
              var room = Room(
                id: _room['room_id'].toString(),
                status: _room['reservation_status'].toString(),
                checkInDate: _room['check_in_date'],
                checkOutDate: _room['check_out_date'],
              );
              roomList.add(room);
            }
          } else if (buttons[2]) {
            if (_room['reservation_status'] == 1) {
              var room = Room(
                id: _room['room_id'].toString(),
                status: _room['reservation_status'].toString(),
                checkInDate: _room['check_in_date'],
                checkOutDate: _room['check_out_date'],
              );
              roomList.add(room);
            }
          }
        });
      }
    } on Error catch (e) {
      print('Error: $e');
    }
    return roomList;
  }
}
