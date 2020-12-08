import 'dart:async';
import 'package:hotel_management/models/parking_detail.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class ParkingDetailQuery {
  Future<Map<String, dynamic>> getParkingDetail(String carId) async {
    String apiUrl = Api.url + "/show/parking/$carId";
    print(apiUrl);
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _data = await networkHelper.getData(useTimeout: true);

      if (_data['is_employ'] == true) {
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
          checkInDate: _data['check_in_date'],
          checkOutDate: _data['check_out_date'],
          carId: _data['car_id'].toString(),
        ).toJsonCustomer();
      }
    } on Error catch (e) {
      print("error on parkingDetailQuery.dart");
    }
  }
}
