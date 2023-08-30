import 'address.dart';
import 'country.dart';
import 'locality.dart';
import 'region.dart';
import 'street.dart';

class Context {
  Country? country;
  Region? region;
  Locality? postcode;
  Locality? place;
  Address? address;
  Street? street;
  Locality? locality;

  Context({
    this.country,
    this.region,
    this.postcode,
    this.place,
    this.address,
    this.street,
    this.locality,
  });

  Context copyWith({
    Country? country,
    Region? region,
    Locality? postcode,
    Locality? place,
    Address? address,
    Street? street,
    Locality? locality,
  }) =>
      Context(
        country: country ?? this.country,
        region: region ?? this.region,
        postcode: postcode ?? this.postcode,
        place: place ?? this.place,
        address: address ?? this.address,
        street: street ?? this.street,
        locality: locality ?? this.locality,
      );

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        region: json["region"] == null ? null : Region.fromJson(json["region"]),
        postcode: json["postcode"] == null
            ? null
            : Locality.fromJson(json["postcode"]),
        place: json["place"] == null ? null : Locality.fromJson(json["place"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        street: json["street"] == null ? null : Street.fromJson(json["street"]),
        locality: json["locality"] == null
            ? null
            : Locality.fromJson(json["locality"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country?.toJson(),
        "region": region?.toJson(),
        "postcode": postcode?.toJson(),
        "place": place?.toJson(),
        "address": address?.toJson(),
        "street": street?.toJson(),
        "locality": locality?.toJson(),
      };
}
