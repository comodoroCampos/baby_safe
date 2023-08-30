class Country {
  String? id;
  String? name;
  String? countryCode;
  String? countryCodeAlpha3;

  Country({
    this.id,
    this.name,
    this.countryCode,
    this.countryCodeAlpha3,
  });

  Country copyWith({
    String? id,
    String? name,
    String? countryCode,
    String? countryCodeAlpha3,
  }) =>
      Country(
        id: id ?? this.id,
        name: name ?? this.name,
        countryCode: countryCode ?? this.countryCode,
        countryCodeAlpha3: countryCodeAlpha3 ?? this.countryCodeAlpha3,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        countryCode: json["country_code"],
        countryCodeAlpha3: json["country_code_alpha_3"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_code": countryCode,
        "country_code_alpha_3": countryCodeAlpha3,
      };
}
