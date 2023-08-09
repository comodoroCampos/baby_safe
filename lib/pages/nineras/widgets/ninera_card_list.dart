import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../models/ninera.dart';
import '../../../utils/medida.dart';

class CardNineraList extends StatelessWidget {
  const CardNineraList({super.key, required this.nineras});
  final List<Ninera> nineras;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Medidas.heigth(100),
      child: ListView.builder(
        itemCount: nineras.length,
        itemBuilder: (context, index) {
          return _card(context, nineras[index]);
        },
      ),
    );
  }

  Widget _card(BuildContext context, Ninera ninera) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                leading: const Icon(Icons.people_alt_outlined),
                title: Text(' ${ninera.nombre}'),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dirección:${ninera.calleNumero}'),
                    Text('Telefono: ${ninera.telefono!}  '),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
