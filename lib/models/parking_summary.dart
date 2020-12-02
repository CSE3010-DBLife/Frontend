class ParkingSummary {
  String parkingStatus;

  ParkingSummary({this.parkingStatus});

  factory ParkingSummary.fromJSON(Map<String, dynamic> json) {
    return ParkingSummary(
      parkingStatus: json['parking status'],
    );
  }
}
