class RoomDetail {
  String id;
  String status;
  String cusName;
  String cusPhoneNum;
  String cusParkNum;
  String cusAddress;
  String cusRequest;
  String adultCount;
  String teenCount;
  String roomSize;
  String roomType;
  String roomPrice;
  String duration;

  RoomDetail({
    this.id,
    this.status,
    this.cusName,
    this.cusPhoneNum,
    this.cusParkNum,
    this.cusAddress,
    this.cusRequest,
    this.adultCount,
    this.teenCount,
    this.roomSize,
    this.roomType,
    this.roomPrice,
    this.duration,
  });

  factory RoomDetail.fromJSON(Map<dynamic, dynamic> json) {
    return RoomDetail(
        id: json['id'],
        status: json['status'],
        cusName: json['cusName'],
        cusPhoneNum: json['cusPhoneNum'],
        cusParkNum: json['cusParkNum'],
        cusAddress: json['cusAddress'],
        cusRequest: json['cusRequest'],
        adultCount: json['adultCount'],
        teenCount: json['teenCount'],
        roomSize: json['roomSize'],
        roomType: json['roomType'],
        roomPrice: json['roomPrice'],
        duration: json['duration']);
  }
}
