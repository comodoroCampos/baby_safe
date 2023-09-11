import '../utils/utils.dart';

class Tutor {
  int? id;
  String? nombres;
  String? apellidos;
  String? calleNumero;
  String? ciudad;
  String? region;
  String? correo;
  String? telefono;
  String? descripcion;
  String? foto;
  String? pass;
  double? latitud;
  double? longitud;

  Tutor(
      {this.id,
      this.nombres,
      this.apellidos,
      this.calleNumero,
      this.ciudad,
      this.region,
      this.correo,
      this.telefono,
      this.descripcion,
      this.foto,
      this.pass,
      this.latitud,
      this.longitud});

  Tutor copyWith(
          {int? id,
          String? nombres,
          String? apellidos,
          String? calleNumero,
          String? ciudad,
          String? region,
          String? correo,
          String? telefono,
          String? descripcion,
          String? foto,
          String? pass,
          double? latitud,
          double? longitud}) =>
      Tutor(
        id: id ?? this.id,
        nombres: nombres ?? this.nombres,
        apellidos: apellidos ?? this.apellidos,
        calleNumero: calleNumero ?? this.calleNumero,
        ciudad: ciudad ?? this.ciudad,
        region: region ?? this.region,
        correo: correo ?? this.correo,
        telefono: telefono ?? this.telefono,
        descripcion: descripcion ?? this.descripcion,
        foto: foto ?? this.foto,
        pass: pass ?? this.pass,
        latitud: latitud ?? this.latitud,
        longitud: longitud ?? this.longitud,
      );

  factory Tutor.fromJson(Map<String, dynamic> json) => Tutor(
        id: json["id"],
        nombres: json["nombres"] == null
            ? null
            : Utilidades.utf8convert(json["nombres"]),
        apellidos: json["apellidos"] == null
            ? null
            : Utilidades.utf8convert(json["apellidos"]),
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
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "calleNumero": calleNumero,
        "ciudad": ciudad,
        "region": region,
        "correo": correo,
        "telefono": telefono,
        "descripcion": descripcion,
        "foto": foto,
        "pass": pass,
        "latitud": latitud,
        "longitud": longitud,
      };
}
