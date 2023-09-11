class GeometryMap {
  String? type;
  List<double>? coordinates;

  GeometryMap({
    this.type,
    this.coordinates,
  });

  GeometryMap copyWith({
    String? type,
    List<double>? coordinates,
  }) =>
      GeometryMap(
        type: type ?? this.type,
        coordinates: coordinates ?? this.coordinates,
      );

  factory GeometryMap.fromJson(Map<String, dynamic> json) => GeometryMap(
        type: json["type"],
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
      };
}
