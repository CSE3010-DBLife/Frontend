class Address {
  String roadAddress;
  String zipCode;
  Address({
    this.roadAddress,
    this.zipCode,
  });

  factory Address.fromJSON(Map<String, dynamic> json) {
    return Address(
      roadAddress: json['roadAddress'],
      zipCode: json['zipCode'],
    );
  }
}
