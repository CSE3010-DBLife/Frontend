import 'dart:async';
import 'package:hotel_management/models/employ_detail.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class EmployDetailQuery {
  Future<EmployDetail> getEmployData(String employId) async {
    String apiUrl = Api.url + "/show/employ/$employId";
    EmployDetail employDetail;
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _data = await networkHelper.getData();
      employDetail = EmployDetail(
        id: employId,
        status: _data['employ_status'].toString(),
        carId: _data['car_id'].toString(),
        name: _data['employ_name'].toString(),
        phone: _data['phone_num'].toString(),
        address: _data['address_detail'].toString(),
        role: _data['role'].toString(),
        salary: _data['salary'].toString(),
      );
    } on Error catch (e) {
      //print(e.stackTrace);
      print("error on employDetailQuery.dart");
    }
    return employDetail;
  }
}
