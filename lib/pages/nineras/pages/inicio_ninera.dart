import 'package:baby_safe/utils/medida.dart';
import 'package:flutter/material.dart';

import '../../../config/menu/menu.dart';
import '../../../config/menu/menu_tutor.dart';
import 'mapa_ninera.dart';
import 'ninera_list.dart';

class InicioNinera extends StatelessWidget {
  const InicioNinera({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title:
            const Text('Niñeras Disponibles', style: TextStyle(fontSize: 16)),
        backgroundColor: const Color.fromRGBO(88, 77, 190, 0.773),
      ),
      drawer: const MenuLateralTutor(),
      body: SizedBox(
        height: Medidas.heigth(100),
        child: Column(children: [
          SizedBox(height: Medidas.heigth(45), child: const MapaNineraPage()),
          SizedBox(
              height: Medidas.heigth(40),
              child: NinerasPage(key: const Key('2'))),
        ]),
      ),
    ));
  }
}
