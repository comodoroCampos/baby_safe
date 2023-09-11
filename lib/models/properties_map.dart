class PropertiesMap {
  String? accuracy;

  PropertiesMap({
    this.accuracy,
  });

  PropertiesMap copyWith({
    String? accuracy,
  }) =>
      PropertiesMap(
        accuracy: accuracy ?? this.accuracy,
      );

  factory PropertiesMap.fromJson(Map<String, dynamic> json) => PropertiesMap(
        accuracy: json["accuracy"],
      );

  Map<String, dynamic> toJson() => {
        "accuracy": accuracy,
      };
}
