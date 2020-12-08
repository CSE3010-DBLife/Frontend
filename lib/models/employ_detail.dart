class EmployDetail {
  String id;
  String name;
  String phone;
  String status; //{0:출근, 1:휴무, 2:결근}
  String carId;
  String role;
  EmployDetail({
    this.id,
    this.phone,
    this.name,
    this.status,
    this.carId,
    this.role,
  });

  factory EmployDetail.fromJSON(Map<String, dynamic> json) {
    return EmployDetail(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      status: json['status'],
      carId: json['car_id'],
      role: json['role'],
    );
  }
}
