class PermisoToken {
  String? authority;

  PermisoToken({
    this.authority,
  });

  PermisoToken copyWith({
    String? authority,
  }) =>
      PermisoToken(
        authority: authority ?? this.authority,
      );

  factory PermisoToken.fromJson(Map<String, dynamic> json) => PermisoToken(
        authority: json["authority"],
      );

  Map<String, dynamic> toJson() => {
        "authority": authority,
      };
}
