class Room {
  String id;
  String status; //{0:예약가능, 1: 예약됨, 2: 사용중, 3: 외출중}
  List<dynamic> checkInDate;
  List<dynamic> checkOutDate;

  Room({this.id, this.status, this.checkInDate, this.checkOutDate});

  factory Room.fromJSON(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      checkInDate: json['check_in_date'],
      checkOutDate: json['check_out_date'],
      status: json['status'],
    );
  }
}
