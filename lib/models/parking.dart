class Parking {
  String carId;
  String parkId;

  Parking({this.carId, this.parkId});

  factory Parking.fromJSON(Map<String, dynamic> json) {
    return Parking(
      parkId: json['park_id'],
      carId: json['car_id'],
    );
  }
}
