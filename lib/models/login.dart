class Login {
  Login({
    required this.user,
    required this.pass,
  });

  final String user;
  final String pass;

  Login copyWith({
    required String user,
    required String pass,
  }) =>
      Login(
        user: user,
        pass: pass,
      );

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        user: json["user"],
        pass: json["pass"],
      );

  Map<String, dynamic> toMap() => {
        "user": user,
        "pass": pass,
      };
}
