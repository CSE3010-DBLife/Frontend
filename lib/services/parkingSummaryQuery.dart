import 'dart:async';
import 'package:hotel_management/models/parking_summary.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';

class ParkingSummaryQuery {
  Future<ParkingSummary> getParkingSummary() async {
    String apiUrl = Api.url + "/show/parking";
    print(apiUrl);
    ParkingSummary parkingSummary;
    try {
      NetWorkHelper networkHelper = NetWorkHelper(url: apiUrl);
      final _data = await networkHelper.getData();
      parkingSummary = ParkingSummary(
        parkingStatus: _data['parking_status'].toString(),
      );
    } on Error catch (e) {
      //print(e.stackTrace);
      print("error on parkingSummaryQuery.dart");
    }
    return parkingSummary;
  }
}
