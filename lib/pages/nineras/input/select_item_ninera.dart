import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> getListaSelectNinera(List<String> list) {
  List<DropdownMenuItem<String>> lista = [];

  for (var act in list) {
    lista.add(DropdownMenuItem(
      value: act,
      child: SizedBox(
        child: Text(
          act,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ));
  }
  return lista;
}
