class Address {
  String? id;
  String? name;
  String? addressNumber;
  String? streetName;

  Address({
    this.id,
    this.name,
    this.addressNumber,
    this.streetName,
  });

  Address copyWith({
    String? id,
    String? name,
    String? addressNumber,
    String? streetName,
  }) =>
      Address(
        id: id ?? this.id,
        name: name ?? this.name,
        addressNumber: addressNumber ?? this.addressNumber,
        streetName: streetName ?? this.streetName,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        addressNumber: json["address_number"],
        streetName: json["street_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address_number": addressNumber,
        "street_name": streetName,
      };
}
