class EmployDetail {
  String id;
  String name;
  String phone;
  String status; //{0:출근, 1:휴무, 2:결근}
  String carId;
  String role;
  String salary;
  String address;
  EmployDetail({this.id, this.phone, this.name, this.status, this.carId, this.role, this.salary, this.address});

  factory EmployDetail.fromJSON(Map<String, dynamic> json) {
    return EmployDetail(
        id: json['id'],
        phone: json['phone'],
        name: json['name'],
        status: json['status'],
        carId: json['car_id'],
        role: json['role'],
        salary: json['salary'],
        address: json['address']);
  }
}
