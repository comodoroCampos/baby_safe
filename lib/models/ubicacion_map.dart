import 'geometri.dart';

class UbicacionMap {
  String? id;
  String? type;
  List<String>? placeType;
  double? relevance;

  String? text;
  String? placeName;
  List<double>? center;
  Geometry? geometry;
  String? address;

  UbicacionMap({
    this.id,
    this.type,
    this.placeType,
    this.relevance,
    this.text,
    this.placeName,
    this.center,
    this.geometry,
    this.address,
  });

  UbicacionMap copyWith({
    String? id,
    String? type,
    List<String>? placeType,
    double? relevance,
    String? text,
    String? placeName,
    List<double>? center,
    Geometry? geometry,
    String? address,
  }) =>
      UbicacionMap(
        id: id ?? this.id,
        type: type ?? this.type,
        placeType: placeType ?? this.placeType,
        relevance: relevance ?? this.relevance,
        text: text ?? this.text,
        placeName: placeName ?? this.placeName,
        center: center ?? this.center,
        geometry: geometry ?? this.geometry,
        address: address ?? this.address,
      );

  factory UbicacionMap.fromJson(Map<String, dynamic> json) => UbicacionMap(
        id: json["id"],
        type: json["type"],
        placeType: json["place_type"] == null
            ? []
            : List<String>.from(json["place_type"]!.map((x) => x)),
        relevance: json["relevance"]?.toDouble(),
        text: json["text"],
        placeName: json["place_name"],
        center: json["center"] == null
            ? []
            : List<double>.from(json["center"]!.map((x) => x?.toDouble())),
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_type": placeType == null
            ? []
            : List<dynamic>.from(placeType!.map((x) => x)),
        "relevance": relevance,
        "text": text,
        "place_name": placeName,
        "center":
            center == null ? [] : List<dynamic>.from(center!.map((x) => x)),
        "geometry": geometry?.toJson(),
        "address": address,
      };
}
