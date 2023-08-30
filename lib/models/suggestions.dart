import 'context.dart';

class Suggestion {
  String? name;
  String? mapboxId;
  String? featureType;
  String? address;
  String? fullAddress;
  String? placeFormatted;
  Context? context;
  String? language;
  String? maki;

  Suggestion(
      {this.name,
      this.mapboxId,
      this.featureType,
      this.address,
      this.fullAddress,
      this.placeFormatted,
      this.context,
      this.language,
      this.maki});

  Suggestion copyWith(
          {String? name,
          String? mapboxId,
          String? featureType,
          String? address,
          String? fullAddress,
          String? placeFormatted,
          Context? context,
          String? language,
          String? maki}) =>
      Suggestion(
          name: name ?? this.name,
          mapboxId: mapboxId ?? this.mapboxId,
          featureType: featureType ?? this.featureType,
          address: address ?? this.address,
          fullAddress: fullAddress ?? this.fullAddress,
          placeFormatted: placeFormatted ?? this.placeFormatted,
          context: context ?? this.context,
          language: language ?? this.language,
          maki: maki ?? this.maki);

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
      name: json["name"],
      mapboxId: json["mapbox_id"],
      featureType: json["feature_type"],
      address: json["address"],
      fullAddress: json["full_address"],
      placeFormatted: json["place_formatted"],
      context:
          json["context"] == null ? null : Context.fromJson(json["context"]),
      language: json["language"],
      maki: json["maki"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "mapbox_id": mapboxId,
        "feature_type": featureType,
        "address": address,
        "full_address": fullAddress,
        "place_formatted": placeFormatted,
        "context": context?.toJson(),
        "language": language,
        "maki": maki
      };
}
