import 'package:baby_safe/utils/medida.dart';
import 'package:flutter/material.dart';

import '../../../config/menu/menu.dart';
import 'mapa_ninera.dart';
import 'ninera_list.dart';

class InicioNinera extends StatelessWidget {
  const InicioNinera({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Niñeras', style: TextStyle(fontSize: 16)),
        backgroundColor: const Color.fromARGB(198, 247, 3, 166),
      ),
      drawer: const MenuLateral(),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: Medidas.heigth(65), child: const MapaNineraPage()),
          SizedBox(
              height: Medidas.heigth(35),
              child: NinerasPage(key: const Key('2'))),
        ]),
      ),
    ));
  }
}
