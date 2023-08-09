import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/ninera.dart';
import '../utils/constantes.dart';

class NineraService {
  final storage = const FlutterSecureStorage();
  final List<Ninera> _nineras = [];

  Map<String, String> header = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  Future<List<Ninera>> getNineras() async {
    _nineras.clear();
    //header.addAll({"Authorization": await storage.read(key: 'token') ?? ''});
    Uri url = Uri.parse('$apiUrl/api-ninera/nineras');
    final resp = await http.get(url, headers: header);

    if (resp.statusCode == 200) {
      final decodedResp = json.decode(resp.body);

      final ord = (decodedResp as List).map((x) => Ninera.fromJson(x)).toList();

      _nineras.addAll(ord);
    }

    return _nineras;
  }

  Future<Ninera?> guardaNinera(Ninera ninera) async {
    // final urlApi = await storage.read(key: 'url') ?? '';
    // header.addAll({"Authorization": await storage.read(key: 'token') ?? ''});
    print(json.encode(ninera.toMap()));
    Uri url = Uri.parse('$apiUrl/api-ninera/ninera');
    final resp = await http.post(url,
        headers: header, body: json.encode(ninera.toMap()));

    if (resp.statusCode == 200) {
      final result = Ninera.fromJson(json.decode(resp.body));

      return result;
    }
    return null;
  }
}
