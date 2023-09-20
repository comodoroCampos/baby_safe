import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static late SharedPreferences _prefs;

  static String _user = '';
  static String _pass = '';
  static String _token = '';
  static String _perfil = '';
  static List<String> _permisos = [];

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get user {
    return _prefs.getString('user') ?? _user;
  }

  static set user(String user) {
    _user = user;
    _prefs.setString('user', user);
  }

  static String get pass {
    return _prefs.getString('pass') ?? _pass;
  }

  static set pass(String pass) {
    _pass = pass;
    _prefs.setString('pass', pass);
  }

  static String get token {
    return _prefs.getString('token') ?? _token;
  }

  static set token(String token) {
    _token = token;
    _prefs.setString('token', token);
  }

  static String get perfil {
    return _prefs.getString('perfil') ?? _perfil;
  }

  static set perfil(String perfil) {
    _perfil = perfil;
    _prefs.setString('perfil', perfil);
  }

  static List<String> get permisos {
    return _prefs.getStringList('permisos') ?? [];
  }

  static set permisos(List<String> permisos) {
    _permisos = permisos;
    _prefs.setStringList('permisos', permisos);
  }
}
