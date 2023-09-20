import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/login.dart';
import '../models/login_token.dart';
import '../preferets/preferencias_usuario.dart';
import '../utils/constantes.dart';

class LoginService {
  final storage = const FlutterSecureStorage();

  Map<String, String> header = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  Future<LoginToken?> login(Login login) async {
    Uri url = Uri.parse('$apiUrl/login');
    final resp =
        await http.post(url, headers: header, body: json.encode(login.toMap()));

    final loginToken = LoginToken.fromJson(json.decode(resp.body));
    // PreferenciasUsuario.user = login.user;
    // PreferenciasUsuario.pass = login.pass;
    // PreferenciasUsuario.token = 'Bearer ${loginToken.token}';
    // PreferenciasUsuario.permisos =
    //     loginToken.permisos!.map((e) => e.authority ?? '').toList();

    storage.write(key: 'token', value: 'Bearer ${loginToken.token}');

    return loginToken;
  }
}
