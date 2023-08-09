class Ninera {
  int? id;
  String? nombre;
  String? calleNumero;
  String? ciudad;
  String? region;
  DateTime? fechaNacimiento;
  String? estadoCivil;
  String? estudios;
  int? valorHora;
  String? correo;
  String? telefono;
  String? descripcion;
  String? foto;
  String? pass;

  Ninera({
    this.id,
    this.nombre,
    this.calleNumero,
    this.ciudad,
    this.region,
    this.fechaNacimiento,
    this.estadoCivil,
    this.estudios,
    this.valorHora,
    this.correo,
    this.telefono,
    this.descripcion,
    this.foto,
    this.pass,
  });

  Ninera copyWith({
    int? id,
    String? nombre,
    String? calleNumero,
    String? ciudad,
    String? region,
    DateTime? fechaNacimiento,
    String? estadoCivil,
    String? estudios,
    int? valorHora,
    String? correo,
    String? telefono,
    String? descripcion,
    String? foto,
    String? pass,
  }) =>
      Ninera(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        calleNumero: calleNumero ?? this.calleNumero,
        ciudad: ciudad ?? this.ciudad,
        region: region ?? this.region,
        fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
        estadoCivil: estadoCivil ?? this.estadoCivil,
        estudios: estudios ?? this.estudios,
        valorHora: valorHora ?? this.valorHora,
        correo: correo ?? this.correo,
        telefono: telefono ?? this.telefono,
        descripcion: descripcion ?? this.descripcion,
        foto: foto ?? this.foto,
        pass: pass ?? this.pass,
      );

  factory Ninera.fromJson(Map<String, dynamic> json) => Ninera(
        id: json["id"],
        nombre: json["nombre"],
        calleNumero: json["calleNumero"],
        ciudad: json["ciudad"],
        region: json["region"],
        fechaNacimiento: json["fechaNacimiento"] == null
            ? null
            : DateTime.parse(json["fechaNacimiento"]),
        estadoCivil: json["estadoCivil"],
        estudios: json["estudios"],
        valorHora: json["valorHora"],
        correo: json["correo"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        foto: json["foto"],
        pass: json["pass"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "calleNumero": calleNumero,
        "ciudad": ciudad,
        "region": region,
        "fechaNacimiento": fechaNacimiento?.toIso8601String(),
        "estadoCivil": estadoCivil,
        "estudios": estudios,
        "valorHora": valorHora,
        "correo": correo,
        "telefono": telefono,
        "descripcion": descripcion,
        "foto": foto,
        "pass": pass,
      };
}
