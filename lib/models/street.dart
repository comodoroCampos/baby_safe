class Street {
  String? name;

  Street({
    this.name,
  });

  Street copyWith({
    String? name,
  }) =>
      Street(
        name: name ?? this.name,
      );

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
