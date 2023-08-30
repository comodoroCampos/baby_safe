class Geometry {
  String? type;
  List<double>? coordinates;
  bool? interpolated;
  bool? omitted;

  Geometry({
    this.type,
    this.coordinates,
    this.interpolated,
    this.omitted,
  });

  Geometry copyWith({
    String? type,
    List<double>? coordinates,
    bool? interpolated,
    bool? omitted,
  }) =>
      Geometry(
        type: type ?? this.type,
        coordinates: coordinates ?? this.coordinates,
        interpolated: interpolated ?? this.interpolated,
        omitted: omitted ?? this.omitted,
      );

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
        interpolated: json["interpolated"],
        omitted: json["omitted"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
        "interpolated": interpolated,
        "omitted": omitted,
      };
}
