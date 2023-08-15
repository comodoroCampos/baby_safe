class Permiso {
  int? usuario;
  String? permiso;

  Permiso({
    this.usuario,
    this.permiso,
  });

  Permiso copyWith({
    int? usuario,
    String? permiso,
  }) =>
      Permiso(
        usuario: usuario ?? this.usuario,
        permiso: permiso ?? this.permiso,
      );

  factory Permiso.fromJson(Map<String, dynamic> json) => Permiso(
        usuario: json["usuario"],
        permiso: json["permiso"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "permiso": permiso,
      };
}
