class ParkingDetail {
  String employName;
  String employId;
  String cusName;
  String employRole;
  String roomId;
  List<dynamic> checkInDate;
  List<dynamic> checkOutDate;
  String carId;

  ParkingDetail({
    this.employName,
    this.employId,
    this.employRole,
    this.cusName,
    this.roomId,
    this.checkInDate,
    this.checkOutDate,
    this.carId,
  });

  ParkingDetail.fromData(Map<String, dynamic> data)
      : employName = data['employName'],
        employId = data['employId'],
        employRole = data['employRole'],
        cusName = data['cusName'],
        roomId = data['roomId'],
        checkInDate = data['checkInDate'],
        checkOutDate = data['checkOutDate'],
        carId = data['carId'];

  Map<String, dynamic> toJsonEmploy() {
    return {
      'employName': employName,
      'employId': employId,
      'employRole': employRole,
      'carId': carId,
    };
  }

  Map<String, dynamic> toJsonCustomer() {
    return {
      'cusName': cusName,
      'roomId': roomId,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'carId': carId,
    };
  }
}
