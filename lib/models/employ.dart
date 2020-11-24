class Employ {
  String id;
  String phone;
  String status; //{0:출근, 1:휴무, 2:결근}
  String role;
  String salary;
  Employ({this.id, this.phone, this.status, this.role, this.salary});

  factory Employ.fromJSON(Map<String, dynamic> json) {
    return Employ(id: json['id'], phone: json['phone'], status: json['status'], role: json['role'], salary: json['salary']);
  }
}
