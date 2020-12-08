import 'dart:async';

import 'package:hotel_management/models/employ.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class EmployQuery {
  String apiUrl = Api.url + "/show/employ";
  Future<List<Employ>> getEmployData() async {
    print(apiUrl);
    List<Employ> employList = [];
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _data = await networkHelper.getData();
      List<dynamic> _employObjects = _data;
      _employObjects.forEach((_employ) {
        var employ = Employ(
          id: _employ['employ_id'].toString(),
          status: _employ['employ_status'].toString(),
          phone: _employ['employ_phone'],
          name: _employ['employ_name'].toString(),
        );
        employList.add(employ);
      });
    } on Error catch (e) {
      //print(e.stackTrace);
      print("error on employQuery.dart");
    }
    return employList;
  }
}
