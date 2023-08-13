import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/tutor.dart';
import '../utils/constantes.dart';

class TutorService {
  final storage = const FlutterSecureStorage();
  final List<Tutor> _tutores = [];

  Map<String, String> header = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  Future<List<Tutor>> getTutores() async {
    _tutores.clear();
    //header.addAll({"Authorization": await storage.read(key: 'token') ?? ''});
    Uri url = Uri.parse('$apiUrl/api-ninera/tutores');
    final resp = await http.get(url, headers: header);

    if (resp.statusCode == 200) {
      final decodedResp = json.decode(resp.body);

      final ord = (decodedResp as List).map((x) => Tutor.fromJson(x)).toList();

      _tutores.addAll(ord);
    }

    return _tutores;
  }

  Future<Tutor?> guardaTutor(Tutor tutor) async {
    // final urlApi = await storage.read(key: 'url') ?? '';
    // header.addAll({"Authorization": await storage.read(key: 'token') ?? ''});
    print(json.encode(tutor.toMap()));
    Uri url = Uri.parse('$apiUrl/api-ninera/tutor');
    final resp =
        await http.post(url, headers: header, body: json.encode(tutor.toMap()));

    if (resp.statusCode == 200) {
      final result = Tutor.fromJson(json.decode(resp.body));

      return result;
    }
    return null;
  }
}
