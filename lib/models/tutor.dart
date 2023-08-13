import '../utils/utils.dart';

class Tutor {
  int? id;
  String? nombre;
  String? apellido;
  String? calleNumero;
  String? ciudad;
  String? region;
  String? correo;
  String? telefono;
  String? descripcion;
  String? foto;
  String? pass;

  Tutor({
    this.id,
    this.nombre,
    this.apellido,
    this.calleNumero,
    this.ciudad,
    this.region,
    this.correo,
    this.telefono,
    this.descripcion,
    this.foto,
    this.pass,
  });

  Tutor copyWith({
    int? id,
    String? nombre,
    String? apellido,
    String? calleNumero,
    String? ciudad,
    String? region,
    String? correo,
    String? telefono,
    String? descripcion,
    String? foto,
    String? pass,
  }) =>
      Tutor(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        calleNumero: calleNumero ?? this.calleNumero,
        ciudad: ciudad ?? this.ciudad,
        region: region ?? this.region,
        correo: correo ?? this.correo,
        telefono: telefono ?? this.telefono,
        descripcion: descripcion ?? this.descripcion,
        foto: foto ?? this.foto,
        pass: pass ?? this.pass,
      );

  factory Tutor.fromJson(Map<String, dynamic> json) => Tutor(
        id: json["id"],
        nombre: json["nombre"] == null
            ? null
            : Utilidades.utf8convert(json["nombre"]),
        apellido: json["apellido"] == null
            ? null
            : Utilidades.utf8convert(json["apellido"]),
        calleNumero: json["calleNumero"] == null
            ? null
            : Utilidades.utf8convert(json["calleNumero"]),
        ciudad: json["ciudad"],
        region: json["region"],
        correo: json["correo"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        foto: json["foto"],
        pass: json["pass"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "calleNumero": calleNumero,
        "ciudad": ciudad,
        "region": region,
        "correo": correo,
        "telefono": telefono,
        "descripcion": descripcion,
        "foto": foto,
        "pass": pass,
      };
}
