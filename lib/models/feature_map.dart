import 'package:baby_safe/models/properties_map.dart';

import 'contex_map.dart';
import 'geomeotry_map.dart';

class FeatureMap {
  String? id;
  String? type;
  List<String>? placeType;
  int? relevance;
  PropertiesMap? properties;
  String? text;
  String? placeName;
  List<double>? center;
  GeometryMap? geometry;
  String? address;
  List<ContextMap>? context;

  FeatureMap({
    this.id,
    this.type,
    this.placeType,
    this.relevance,
    this.properties,
    this.text,
    this.placeName,
    this.center,
    this.geometry,
    this.address,
    this.context,
  });

  FeatureMap copyWith({
    String? id,
    String? type,
    List<String>? placeType,
    int? relevance,
    PropertiesMap? properties,
    String? text,
    String? placeName,
    List<double>? center,
    GeometryMap? geometry,
    String? address,
    List<ContextMap>? context,
  }) =>
      FeatureMap(
        id: id ?? this.id,
        type: type ?? this.type,
        placeType: placeType ?? this.placeType,
        relevance: relevance ?? this.relevance,
        properties: properties ?? this.properties,
        text: text ?? this.text,
        placeName: placeName ?? this.placeName,
        center: center ?? this.center,
        geometry: geometry ?? this.geometry,
        address: address ?? this.address,
        context: context ?? this.context,
      );

  factory FeatureMap.fromJson(Map<String, dynamic> json) => FeatureMap(
        id: json["id"],
        type: json["type"],
        placeType: json["place_type"] == null
            ? []
            : List<String>.from(json["place_type"]!.map((x) => x)),
        relevance: json["relevance"],
        properties: json["properties"] == null
            ? null
            : PropertiesMap.fromJson(json["properties"]),
        text: json["text"],
        placeName: json["place_name"],
        center: json["center"] == null
            ? []
            : List<double>.from(json["center"]!.map((x) => x?.toDouble())),
        geometry: json["geometry"] == null
            ? null
            : GeometryMap.fromJson(json["geometry"]),
        address: json["address"],
        context: json["context"] == null
            ? []
            : List<ContextMap>.from(
                json["context"]!.map((x) => ContextMap.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_type": placeType == null
            ? []
            : List<dynamic>.from(placeType!.map((x) => x)),
        "relevance": relevance,
        "properties": properties?.toJson(),
        "text": text,
        "place_name": placeName,
        "center":
            center == null ? [] : List<dynamic>.from(center!.map((x) => x)),
        "geometry": geometry?.toJson(),
        "address": address,
        "context": context == null
            ? []
            : List<dynamic>.from(context!.map((x) => x.toJson())),
      };
}
