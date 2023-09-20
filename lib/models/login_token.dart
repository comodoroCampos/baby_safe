import 'package:baby_safe/models/permisos_token.dart';

class LoginToken {
  String? message;
  List<PermisoToken>? permisos;
  String? nombre;
  String? token;
  String? perfil;

  LoginToken({
    this.message,
    this.permisos,
    this.nombre,
    this.token,
    this.perfil,
  });

  LoginToken copyWith({
    String? message,
    List<PermisoToken>? permisos,
    String? nombre,
    String? token,
    String? perfil,
  }) =>
      LoginToken(
        message: message ?? this.message,
        permisos: permisos ?? this.permisos,
        nombre: nombre ?? this.nombre,
        token: token ?? this.token,
        perfil: perfil ?? this.perfil,
      );

  factory LoginToken.fromJson(Map<String, dynamic> json) => LoginToken(
        message: json["message"],
        permisos: json["permisos"] == null
            ? []
            : List<PermisoToken>.from(
                json["permisos"]!.map((x) => PermisoToken.fromJson(x))),
        nombre: json["nombre"],
        token: json["token"],
        perfil: json["perfil"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "permisos": permisos == null
            ? []
            : List<dynamic>.from(permisos!.map((x) => x.toJson())),
        "nombre": nombre,
        "token": token,
        "perfil": perfil,
      };
}
