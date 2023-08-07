import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../input/input_string_ninera.dart';
import '../input/select_item_ninera.dart';

class RegistroNineraPage extends StatelessWidget {
  RegistroNineraPage({super.key});
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final Map<String, Object> formNinera = {
    'nombre': '',
    'calle_numero': '',
    'ciudad': '',
    'region': '',
    'fecha_nacimiento': '',
    'estado_civil': '',
    'estudios': '',
    'valor_hora': 0,
    'correo': '',
    'pass': '',
    'telefono': '',
    'descripcion': '',
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Registro Niñera', style: TextStyle(fontSize: 16)),
        backgroundColor: const Color.fromARGB(198, 247, 3, 166),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Form(
              child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  children: [
                    InputStringNinera(
                        lineas: 1,
                        width: double.infinity,
                        obscureText: false,
                        requerido: true,
                        formProperty: 'nombre',
                        suffixIcon: Icons.search_outlined,
                        labelText: 'Nombre Completo',
                        msjValidacion: 'Ingrese nombre y apellido',
                        soloLectura: false,
                        valorInicial: '',
                        formValues: formNinera),
                    InputStringNinera(
                        lineas: 1,
                        width: double.infinity,
                        obscureText: false,
                        requerido: false,
                        formProperty: 'calle_numero',
                        suffixIcon: Icons.search_outlined,
                        labelText: 'Dirección',
                        msjValidacion: 'ingrese su dirección',
                        soloLectura: false,
                        valorInicial: '',
                        formValues: formNinera),
                    DropdownButtonFormField<String>(
                        value: 'Seleccione',
                        decoration: const InputDecoration(
                          labelText: 'Región',
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Seleccione una Región';
                          }
                          if (value == 'Seleccione') {
                            return 'Seleccione una Región';
                          }
                          return null;
                        },
                        items: getListaSelectNinera([
                          'Seleccione',
                          'Region Valparaiso',
                          'Region Arica',
                          'Region Araucania'
                        ]),
                        onChanged: (value) {
                          formNinera['region'] = value ?? 'Seleccione';
                          print(formNinera['region']);
                        }),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    ));
  }
}
