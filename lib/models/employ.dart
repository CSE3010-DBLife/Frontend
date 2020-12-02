class Employ {
  String id;
  String phone;
  String name;
  String status; //{0:출근, 1:휴무, 2:결근}
  Employ({this.id, this.name, this.phone, this.status});

  factory Employ.fromJSON(Map<String, dynamic> json) {
    return Employ(id: json['id'], name: json['name'], phone: json['phone'], status: json['status']);
  }
}
