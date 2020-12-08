import 'dart:async';
import 'package:hotel_management/models/employ_detail.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class EmployDetailQuery {
  Future<EmployDetail> getEmployData(String employId) async {
    String apiUrl = Api.url + "/show/employ/$employId";
    print(apiUrl);
    EmployDetail employDetail;
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _data = await networkHelper.getData();
      print(_data['role']);
      employDetail = EmployDetail(
        id: employId,
        status: _data['employ_status'].toString(),
        carId: _data['car_id'] == 'no_car' ? '차량 없음' : _data['car_id'].toString(),
        name: _data['employ_name'].toString(),
        phone: _data['phone_num'].toString(),
        role: _data['role'].toString(),
      );
    } on Error catch (e) {
      //print(e.stackTrace);
      print("error on employDetailQuery.dart");
    }
    return employDetail;
  }
}
