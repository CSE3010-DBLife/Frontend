class RoomDetail {
  String id;
  String status;
  String cusName;
  String cusphoneNum;
  String cusparkNum;
  String cusaddress;
  int adultCount;
  int teenCount;
  String roomSize;
  String roomType;
  String roomPrice;

  RoomDetail({
    this.id,
    this.status,
    this.cusName,
    this.cusphoneNum,
    this.cusparkNum,
    this.cusaddress,
    this.adultCount,
    this.teenCount,
    this.roomSize,
    this.roomType,
    this.roomPrice,
  });

  factory RoomDetail.fromJSON(Map<dynamic, dynamic> json) {
    return RoomDetail(
      id: json['id'],
      status: json['status'],
      cusName: json['cusName'],
      cusphoneNum: json['cusphoneNum'],
      cusparkNum: json['cusparkNum'],
      cusaddress: json['cusaddress'],
      adultCount: json['adultCount'],
      teenCount: json['teenCount'],
      roomSize: json['roomSize'],
      roomType: json['roomType'],
      roomPrice: json['roomPrice'],
    );
  }
}
