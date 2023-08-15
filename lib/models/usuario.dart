import 'ninera.dart';
import 'permiso.dart';
import 'tutor.dart';

class Usuario {
  int? id;
  String? usuario;
  String? correo;
  String? pass;
  String? perfil;
  List<Permiso>? permisos;
  Ninera? ninera;
  Tutor? tutor;
  Usuario(
      {this.id,
      this.usuario,
      this.correo,
      this.pass,
      this.perfil,
      this.permisos,
      this.ninera,
      this.tutor});

  Usuario copyWith({
    int? id,
    String? usuario,
    String? correo,
    String? pass,
    String? perfil,
    List<Permiso>? permisos,
    Ninera? ninera,
    Tutor? tutor,
  }) =>
      Usuario(
        id: id ?? this.id,
        usuario: usuario ?? this.usuario,
        correo: correo ?? this.correo,
        pass: pass ?? this.pass,
        perfil: perfil ?? this.perfil,
        permisos: permisos ?? this.permisos,
        ninera: ninera ?? this.ninera,
        tutor: tutor ?? this.tutor,
      );

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        usuario: json["usuario"],
        correo: json["correo"],
        pass: json["pass"],
        perfil: json["perfil"],
        permisos: json["permisos"] == null
            ? []
            : List<Permiso>.from(
                json["permisos"]!.map((x) => Permiso.fromJson(x))),
        ninera: json["ninera"] == null ? null : Ninera.fromJson(json["ninera"]),
        tutor: json["tutor"] == null ? null : Tutor.fromJson(json["tutor"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "correo": correo,
        "pass": pass,
        "perfil": perfil,
        "permisos": permisos == null
            ? []
            : List<dynamic>.from(permisos!.map((x) => x.toJson())),
        "ninera": ninera?.toMap(),
        "tutor": tutor?.toMap(),
      };
}
