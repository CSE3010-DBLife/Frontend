import 'package:flutter/material.dart';
import 'package:hotel_management/utilities/constants.dart';

class StatusWorker {
  static String getRoomStatus(String status) {
    if (status == "0")
      return "미사용 중";
    else if (status == "1")
      return "사용 중";
    else
      return "오류";
  }

  static Color getRoomStatusColor(String status) {
    if (status == "0")
      return statusOrange;
    else if (status == "1")
      return statusRed;
    else
      return Colors.black;
  }

  static String getEmployStatus(String status) {
    if (status == "0")
      return "휴가";
    else if (status == "1")
      return "출근";
    else if (status == "2")
      return "결근";
    else
      return "오류";
  }

  static Color getEmployStatusColor(String status) {
    if (status == "0")
      return statusGrey;
    else if (status == "1")
      return statusGreen;
    else if (status == "2")
      return statusRed;
    else
      return Colors.black;
  }

  static Color getParkingStatusColor(double percent) {
    if (percent <= 0.25) {
      return Colors.green;
    } else if (percent > 0.25 && percent <= 0.50) {
      return Colors.yellow;
    } else if (percent > 0.50 && percent <= 0.80) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  static String getParkingStatusMsg(double percent) {
    if (percent <= 0.25) {
      return "주차 공간이 양호 합니다.";
    } else if (percent > 0.25 && percent <= 0.50) {
      return "주차 공간이 조금 찼습니다.";
    } else if (percent > 0.50 && percent <= 0.80) {
      return "주차 공간이 거의 찼습니다.";
    } else {
      return "주차 공간이 다 찼거나, 조금 남았습니다.";
    }
  }
}
