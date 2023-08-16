import 'dart:convert';

import 'package:baby_safe/models/usuario.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../utils/constantes.dart';

class UsuarioService {
  final storage = const FlutterSecureStorage();

  Map<String, String> header = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  Future<Usuario?> guardaUsuario(Usuario usuario) async {
    // final urlApi = await storage.read(key: 'url') ?? '';
    // header.addAll({"Authorization": await storage.read(key: 'token') ?? ''});
    if (kDebugMode) {
      print(json.encode(usuario.toJson()));
    }
    Uri url = Uri.parse('$apiUrl/api-usuario/usuario');
    final resp = await http.post(url,
        headers: header, body: json.encode(usuario.toJson()));

    if (resp.statusCode == 200) {
      final result = Usuario.fromJson(json.decode(resp.body));

      return result;
    }
    return null;
  }
}
