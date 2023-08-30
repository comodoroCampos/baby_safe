class Locality {
  String? id;
  String? name;

  Locality({
    this.id,
    this.name,
  });

  Locality copyWith({
    String? id,
    String? name,
  }) =>
      Locality(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Locality.fromJson(Map<String, dynamic> json) => Locality(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
