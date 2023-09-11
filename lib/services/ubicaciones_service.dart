import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/suggestions.dart';
import '../models/ubicacion_map.dart';
import '../utils/constantes.dart';

class UbicacionService {
  final storage = const FlutterSecureStorage();

  final List<Suggestion> _sugerencias = [];

  Map<String, String> header = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  Future<UbicacionMapbox?> getUbicaciones(String query) async {
    Uri url = Uri.parse(
        '$urlMapBox/$query.json?proximity=ip&access_token=$tokenMapBox&limit=1');
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final decodedResp = json.decode(resp.body);
      if (kDebugMode) {
        print(decodedResp);
      }
      return UbicacionMapbox.fromJson(decodedResp);
    }

    return null;
  }

  Future<List<Suggestion>> getsugerencias(String query) async {
    _sugerencias.clear();
    if (query.length < 8) {
      return _sugerencias;
    }
    Uri url = Uri.parse(
        '$urlMapBoxSugerencia?q=$query&language=es&session_token=00d316a6-0ed8-41b1-88a4-45301f905c5b&access_token=$tokenMapBox');
    final resp = await http.get(url);

    if (resp.statusCode == 200) {
      final decodedResp = json.decode(resp.body);

      _sugerencias.addAll(List<Suggestion>.from(
          decodedResp["suggestions"]!.map((x) => Suggestion.fromJson(x))));
    }

    return _sugerencias;
  }
}
