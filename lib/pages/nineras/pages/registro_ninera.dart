import 'dart:ffi';

import 'package:baby_safe/models/ninera.dart';
import 'package:baby_safe/pages/nineras/input/input_number_tutor.dart';
import 'package:baby_safe/services/ninera_service.dart';
import 'package:baby_safe/services/ubicaciones_service.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../bloc/usuario/usuario_bloc.dart';
import '../../../config/menu/menu.dart';
import '../../../models/feature_map.dart';
import '../../../models/suggestions.dart';
import '../../../models/ubicacion_map.dart';

import '../../../models/usuario.dart';
import '../../../services/usuarioService.dart';
import '../../../utils/constantes.dart';
import '../../../utils/utils.dart';
import '../input/input_string_ninera.dart';
import '../input/select_item_ninera.dart';

class RegistroNineraPage extends StatelessWidget {
  RegistroNineraPage({super.key});
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final nineraService = NineraService();
  final usuarioService = UsuarioService();
  final ubicacionespService = UbicacionService();
  List<UbicacionMapbox> ubicaciones = [];
  final Map<String, Object> formNinera = {
    'nombre': '',
    'calle_numero': '',
    'ciudad': '',
    'region': '',
    'fecha_nacimiento': DateTime.now(),
    'estado_civil': '',
    'estudios': '',
    'valor_hora': 0,
    'telefono': '',
    'descripcion': '',
    'lat': 0.0,
    'lng': 0.0,
  };
  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context, listen: false);
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
                        autoCompleteDireccion(),
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
                                ['Seleccione', 'Soltera', 'Casada']),
                            onChanged: (value) {
                              formNinera['estado_civil'] =
                                  value ?? 'Seleccione';
                            }),
                        DropdownButtonFormField<String>(
                            value: 'Educación Superior',
                            focusColor: Colors.black,
                            decoration: const InputDecoration(
                                labelText: 'Estudios',
                                fillColor: Colors.black,
                                focusColor: Colors.black,
                                isDense: true),
                            validator: (value) {
                              if (value == null) {
                                return 'Seleccione nivel de estudios';
                              }
                              if (value == 'Seleccione') {
                                return 'Seleccione nivel de estudios';
                              }
                              return null;
                            },
                            items: getListaSelectNinera(estudios),
                            onChanged: (value) {
                              formNinera['estudios'] = value ?? 'Seleccione';
                            }),
                        InputStringNinera(
                            lineas: 1,
                            width: double.infinity,
                            obscureText: false,
                            requerido: true,
                            formProperty: 'telefono',
                            suffixIcon: Icons.search_outlined,
                            labelText: 'Telefono',
                            msjValidacion: 'ingrese numero de contacto',
                            soloLectura: false,
                            valorInicial: '+569-',
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
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          child: DateTimeFormField(
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.event_note),
                              labelText: 'Seleccionar fecha nacimiento',
                            ),
                            mode: DateTimeFieldPickerMode.date,
                            autovalidateMode: AutovalidateMode.always,
                            validator: (e) => (e == null) ? '' : null,
                            onDateSelected: (DateTime value) {
                              formNinera['fecha_nacimiento'] = value;
                            },
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () async {
                                if (myFormKey.currentState!.validate()) {
                                  Usuario user = usuarioBloc.state.usuario!;
                                  user.ninera = Ninera(
                                      nombre: formNinera['nombre'].toString(),
                                      calleNumero:
                                          formNinera['calle_numero'].toString(),
                                      ciudad: formNinera['ciudad'].toString(),
                                      correo: formNinera['correo'].toString(),
                                      descripcion:
                                          formNinera['descripcion'].toString(),
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
                                          formNinera['valor_hora'].toString()),
                                      latitud: double.parse(
                                          formNinera['lat'].toString()),
                                      longitud: double.parse(
                                          formNinera['lng'].toString()));
                                  usuarioBloc
                                      .add(CargaNineraUsuario(user.ninera!));
                                  Utilidades.mostrarAlerta(
                                      'Guardando...', context);
                                  await usuarioService.guardaUsuario(user);
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(context, 'login');
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

  Widget autoCompleteDireccion() {
    List<String> direcciones = [];
    return TypeAheadFormField(
      textFieldConfiguration: TextFieldConfiguration(
          controller: _typeAheadController,
          decoration: const InputDecoration(labelText: 'Dirección')),
      suggestionsCallback: (pattern) {
        return ubicacionespService.getsugerencias(pattern);
      },
      itemBuilder: (context, Suggestion suggestion) {
        return ListTile(
          title: Text(suggestion.context?.address?.name ?? ''),
          subtitle: Text(suggestion.context?.region?.name ?? ''),
        );
      },
      transitionBuilder: (context, suggestionsBox, controller) {
        return suggestionsBox;
      },
      onSuggestionSelected: (Suggestion suggestion) {
        _typeAheadController.text = suggestion.context?.address?.name ?? '';
        direcciones.add(suggestion.context?.address?.name ?? '');
        formNinera['calle_numero'] = suggestion.context?.address?.name ?? '';
        if (suggestion.context?.address?.name != null) {
          _cargaUnicaiones(suggestion.context?.address?.name ?? '');
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Seleccione Dirección';
        }
        if (!direcciones.contains(value)) {
          return 'Direccion no válida';
        }
        if (value != null) {
          formNinera['calle_numero'] = value;
          _cargaUnicaiones(value);
        }
      },
      onSaved: (value) {
        formNinera['calle_numero'] = value ?? '';
        if (value != null) {
          _cargaUnicaiones(value);
        }
      },
    );
  }

  _cargaUnicaiones(String direccion) async {
    UbicacionMapbox? mp = await ubicacionespService.getUbicaciones(direccion);
    for (FeatureMap ub in mp?.features ?? []) {
      formNinera['lat'] = ub.geometry!.coordinates![1];
      formNinera['lng'] = ub.geometry!.coordinates![0];
    }
  }
}
