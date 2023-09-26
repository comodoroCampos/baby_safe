import 'dart:convert';

import 'package:flutter/material.dart';

class Utilidades {
  static String utf8convert(String text) {
    String texto = '';
    try {
      List<int> bytes = text.codeUnits;
      texto = utf8.decode(bytes);
    } catch (e) {
      texto = text;
    }

    return texto;
  }

  static void mostrarAlerta(String titulo, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: AlertDialog(
            title: Text(titulo),
            content: const LinearProgressIndicator(),
            actions: const <Widget>[],
          ),
        );
      },
    );
  }
}
