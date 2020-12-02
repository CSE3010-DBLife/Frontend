import 'package:flutter/material.dart';
import 'package:hotel_management/utilities/constants.dart';

class StatusWorker {
  static String getRoomStatus(String status) {
    if (status == "0")
      return "예약 가능";
    else if (status == "1")
      return "예약 됨";
    else if (status == "2")
      return "사용 중";
    else if (status == "3")
      return "외출 중";
    else
      return "오류";
  }

  static Color getRoomStatusColor(String status) {
    if (status == "0")
      return statusGrey;
    else if (status == "1")
      return statusGreen;
    else if (status == "2")
      return statusRed;
    else if (status == "3")
      return statusOrange;
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
}
