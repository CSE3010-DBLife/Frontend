import 'dart:async';
import 'package:hotel_management/models/parking_detail.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class ParkingDetailQuery {
  Future<Map<String, dynamic>> getParkingDetail(String carId) async {
    String apiUrl = Api.url + "/show/parking/$carId";
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _data = await networkHelper.getData();
      if (_data['employ_name'] != null) {
        return ParkingDetail(
          employName: _data['employ_name'].toString(),
          employId: _data['employ_id'].toString(),
          employRole: _data['employ_role'].toString(),
          carId: _data['car_id'].toString(),
        ).toJsonEmploy();
      } else {
        return ParkingDetail(
                cusName: _data['cus_name'].toString(),
                roomId: _data['room_id'].toString(),
                checkInDate: _data['check_in_date'].toString(),
                checkOutDate: _data['check_out_date'].toString(),
                carId: _data['car_id'].toString())
            .toJsonCustomer();
      }
    } on Error catch (e) {
      print(e.stackTrace);
      print("error on parkingDetailQuery.dart");
    }
  }
}
