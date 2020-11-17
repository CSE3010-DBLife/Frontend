class Room {
  String id;
  String status; //{0:예약가능, 1: 예약됨, 2: 사용중, 3: 외출중}

  Room({this.id, this.status});

  factory Room.fromJSON(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      status: json['status'],
    );
  }
}
