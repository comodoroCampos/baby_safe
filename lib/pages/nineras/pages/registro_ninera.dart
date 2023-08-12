import 'package:baby_safe/models/ninera.dart';
import 'package:baby_safe/pages/nineras/input/input_number_tutor.dart';
import 'package:baby_safe/services/ninera_service.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import '../../../config/menu/menu.dart';
import '../../../utils/constantes.dart';
import '../input/input_string_ninera.dart';
import '../input/select_item_ninera.dart';

class RegistroNineraPage extends StatelessWidget {
  RegistroNineraPage({super.key});
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final nineraService = NineraService();
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
      drawer: const MenuLateral(),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Form(
              key: myFormKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
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
                            obscureText: true,
                            requerido: false,
                            formProperty: 'pass',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'Contraseña',
                            msjValidacion: 'ingrese su contraseña',
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
                        InputStringNinera(
                            lineas: 1,
                            width: double.infinity,
                            obscureText: false,
                            requerido: false,
                            formProperty: 'ciudad',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'Ciudad',
                            msjValidacion: 'ingrese su Ciudad',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formNinera),
                        DropdownButtonFormField<String>(
                            value: 'Región Metropolitana',
                            focusColor: Colors.black,
                            decoration: const InputDecoration(
                                labelText: 'Región',
                                fillColor: Colors.black,
                                focusColor: Colors.black,
                                isDense: true),
                            validator: (value) {
                              if (value == null) {
                                return 'Seleccione una Región';
                              }
                              if (value == 'Seleccione') {
                                return 'Seleccione una Región';
                              }
                              return null;
                            },
                            items: getListaSelectNinera(regionesChile),
                            onChanged: (value) {
                              formNinera['region'] = value ?? 'Seleccione';
                            }),
                        DropdownButtonFormField<String>(
                            value: 'Seleccione',
                            focusColor: Colors.black,
                            decoration: const InputDecoration(
                                labelText: 'Estado civil',
                                fillColor: Colors.black,
                                focusColor: Colors.black,
                                isDense: true),
                            validator: (value) {
                              if (value == null) {
                                return 'Seleccione estado civil';
                              }
                              if (value == 'Seleccione') {
                                return 'Seleccione stado civil';
                              }
                              return null;
                            },
                            items: getListaSelectNinera(
                                ['Seleccione', 'Solter@', 'Casad@']),
                            onChanged: (value) {
                              formNinera['estado_civil'] =
                                  value ?? 'Seleccione';
                            }),
                        InputStringNinera(
                            lineas: 1,
                            width: double.infinity,
                            obscureText: false,
                            requerido: false,
                            formProperty: 'estudios',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'Estudios',
                            msjValidacion: 'ingrese su nivel de estudios',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formNinera),
                        InputStringNinera(
                            lineas: 1,
                            width: double.infinity,
                            obscureText: false,
                            requerido: false,
                            formProperty: 'correo',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'correo electronico',
                            msjValidacion: 'ingrese su correo electronico',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formNinera),
                        InputStringNinera(
                            lineas: 1,
                            width: double.infinity,
                            obscureText: false,
                            requerido: false,
                            formProperty: 'telefono',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'Telefono',
                            msjValidacion: 'ingrese numero de contacto',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formNinera),
                        InputStringNinera(
                            lineas: 3,
                            width: double.infinity,
                            obscureText: false,
                            requerido: false,
                            formProperty: 'descripcion',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'Descripción',
                            msjValidacion: 'descripción',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formNinera),
                        InputNumberNinera(
                          formProperty: 'valor_hora',
                          labelText: 'Valor Hora',
                          formValues: formNinera,
                          decimales: false,
                          valorInicial: '0',
                        ),
                        DateTimeFormField(
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.event_note),
                            labelText: 'Only time',
                          ),
                          mode: DateTimeFieldPickerMode.date,
                          autovalidateMode: AutovalidateMode.always,
                          validator: (e) => (e?.day ?? 0) == 1
                              ? 'Please not the first day'
                              : null,
                          onDateSelected: (DateTime value) {
                            print(value);
                          },
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                if (myFormKey.currentState!.validate()) {
                                  nineraService.guardaNinera(Ninera(
                                      nombre: formNinera['nombre'].toString(),
                                      calleNumero:
                                          formNinera['calle_numero'].toString(),
                                      ciudad: formNinera['ciudad'].toString(),
                                      correo: formNinera['correo'].toString(),
                                      descripcion:
                                          formNinera['nombre'].toString(),
                                      estadoCivil:
                                          formNinera['estado_civil'].toString(),
                                      estudios:
                                          formNinera['estudios'].toString(),
                                      fechaNacimiento: DateTime.now(),
                                      foto:
                                          'https://imgv3.fotor.com/images/videoImage/ai-generated-beautiful-girl-like-a-beautiful-model-by-Fotor-ai-image-generator_2023-05-30-053050_brwf.jpg',
                                      pass: formNinera['pass'].toString(),
                                      region: formNinera['region'].toString(),
                                      telefono:
                                          formNinera['telefono'].toString(),
                                      valorHora: int.parse(
                                          formNinera['valor_hora']
                                              .toString())));
                                }
                              },
                              child: const Text('Registrar')),
                        )
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
