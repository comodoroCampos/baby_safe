import 'feature_map.dart';

class UbicacionMapbox {
  String? type;
  List<String>? query;
  List<FeatureMap>? features;
  String? attribution;

  UbicacionMapbox({
    this.type,
    this.query,
    this.features,
    this.attribution,
  });

  UbicacionMapbox copyWith({
    String? type,
    List<String>? query,
    List<FeatureMap>? features,
    String? attribution,
  }) =>
      UbicacionMapbox(
        type: type ?? this.type,
        query: query ?? this.query,
        features: features ?? this.features,
        attribution: attribution ?? this.attribution,
      );

  factory UbicacionMapbox.fromJson(Map<String, dynamic> json) =>
      UbicacionMapbox(
        type: json["type"],
        query: json["query"] == null
            ? []
            : List<String>.from(json["query"]!.map((x) => x)),
        features: json["features"] == null
            ? []
            : List<FeatureMap>.from(
                json["features"]!.map((x) => FeatureMap.fromJson(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "query": query == null ? [] : List<dynamic>.from(query!.map((x) => x)),
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
        "attribution": attribution,
      };
}
