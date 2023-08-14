import 'package:baby_safe/models/ninera.dart';
import 'package:baby_safe/models/tutor.dart';
import 'package:baby_safe/pages/nineras/input/input_number_tutor.dart';
import 'package:baby_safe/pages/nineras/input/select_item_ninera.dart';
import 'package:baby_safe/services/ninera_service.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import '../../../config/menu/menu.dart';
import '../../../services/tutor_service.dart';
import '../../../utils/constantes.dart';
import '../../nineras/input/input_string_ninera.dart';

class RegistroTutorPage extends StatelessWidget {
  RegistroTutorPage({super.key});
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final tutorService = TutorService();
  final Map<String, Object> formTutor = {
    'nombre': '',
    'apellido': '',
    'calle_numero': '',
    'ciudad': '',
    'region': '',
    'telefono': '',
    'descripcion': '',
    'correo': '',
    'pass': '',
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Registro Tutor', style: TextStyle(fontSize: 16)),
        backgroundColor: Color.fromARGB(197, 3, 101, 247),
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
                            labelText: 'Nombres',
                            msjValidacion: 'Ingrese nombres',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formTutor),
                        InputStringNinera(
                            lineas: 1,
                            width: double.infinity,
                            obscureText: false,
                            requerido: true,
                            formProperty: 'apellido',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'Apellidos',
                            msjValidacion: 'Ingrese apellidos',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formTutor),
                        InputStringNinera(
                            lineas: 1,
                            width: double.infinity,
                            obscureText: true,
                            requerido: false,
                            formProperty: 'pass',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'Contraseña',
                            msjValidacion: 'Ingrese su contraseña',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formTutor),
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
                            formValues: formTutor),
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
                            formValues: formTutor),
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
                              formTutor['region'] = value ?? 'Seleccione';
                            }),
                        InputStringNinera(
                            lineas: 1,
                            width: double.infinity,
                            obscureText: false,
                            requerido: false,
                            formProperty: 'correo',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'correo electronico',
                            msjValidacion: 'Ingrese su correo electronico',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formTutor),
                        InputStringNinera(
                            lineas: 1,
                            width: double.infinity,
                            obscureText: false,
                            requerido: false,
                            formProperty: 'telefono',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'Telefono',
                            msjValidacion: 'Ingrese telefono de contacto',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formTutor),
                        InputStringNinera(
                            lineas: 3,
                            width: double.infinity,
                            obscureText: false,
                            requerido: false,
                            formProperty: 'descripcion',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'Descripción',
                            msjValidacion: 'Ingrese descripción',
                            soloLectura: false,
                            valorInicial: '',
                            formValues: formTutor),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                if (myFormKey.currentState!.validate()) {
                                  tutorService.guardaTutor(Tutor(
                                    nombre: formTutor['nombre'].toString(),
                                    apellido: formTutor['apellido'].toString(),
                                    calleNumero:
                                        formTutor['calle_numero'].toString(),
                                    ciudad: formTutor['ciudad'].toString(),
                                    correo: formTutor['correo'].toString(),
                                    descripcion: formTutor['nombre'].toString(),
                                    foto:
                                        'https://imgv3.fotor.com/images/videoImage/ai-generated-beautiful-girl-like-a-beautiful-model-by-Fotor-ai-image-generator_2023-05-30-053050_brwf.jpg',
                                    pass: formTutor['pass'].toString(),
                                    region: formTutor['region'].toString(),
                                    telefono: formTutor['telefono'].toString(),
                                  ));
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
