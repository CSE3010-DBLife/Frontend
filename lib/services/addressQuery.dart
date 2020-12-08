import 'dart:async';

import 'package:hotel_management/models/address.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class AddressQuery {
  Future<List<Address>> getAddressData(String keyword) async {
    String apiUrl = Api.jusoUrl + "&keyword=$keyword&confmKey=devU01TX0FVVEgyMDIwMTIwNDE1MTgxMzExMDUwNDE=&resultType=json";
    print(apiUrl);
    List<Address> addressList = [];
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _tmp = await networkHelper.getData();
      final List _data = _tmp['results']['juso'];
      print(_data);
      _data.forEach((element) {
        addressList.add(Address(roadAddress: element["roadAddr"], zipCode: element["zipNo"].toString()));
      });
    } on Error catch (e) {
      //print(e.stackTrace);
      print(e);
      print("error on addressQuery.dart");
    }
    return addressList;
  }
}
