import 'package:baby_safe/models/tutor.dart';
import 'package:baby_safe/models/usuario.dart';

import 'package:baby_safe/pages/nineras/input/select_item_ninera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../bloc/usuario/usuario_bloc.dart';
import '../../../config/menu/menu.dart';
import '../../../models/feature_map.dart';
import '../../../models/suggestions.dart';
import '../../../models/ubicacion_map.dart';
import '../../../services/tutor_service.dart';
import '../../../services/ubicaciones_service.dart';
import '../../../services/usuarioService.dart';
import '../../../utils/constantes.dart';
import '../../../utils/utils.dart';
import '../../nineras/input/input_string_ninera.dart';

class RegistroTutorPage extends StatelessWidget {
  RegistroTutorPage({super.key});
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final tutorService = TutorService();
  final usuarioService = UsuarioService();
  final ubicacionespService = UbicacionService();
  final Map<String, Object> formTutor = {
    'nombre': '',
    'apellido': '',
    'calle_numero': '',
    'ciudad': '',
    'region': '',
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
        title: const Text('Registro Tutor', style: TextStyle(fontSize: 16)),
        backgroundColor: const Color.fromARGB(197, 3, 101, 247),
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
                              onPressed: () async {
                                if (myFormKey.currentState!.validate()) {
                                  Tutor tutor = Tutor(
                                      nombres: formTutor['nombre'].toString(),
                                      apellidos:
                                          formTutor['apellido'].toString(),
                                      calleNumero:
                                          formTutor['calle_numero'].toString(),
                                      ciudad: formTutor['ciudad'].toString(),
                                      correo: formTutor['correo'].toString(),
                                      descripcion:
                                          formTutor['nombre'].toString(),
                                      foto:
                                          'https://imgv3.fotor.com/images/videoImage/ai-generated-beautiful-girl-like-a-beautiful-model-by-Fotor-ai-image-generator_2023-05-30-053050_brwf.jpg',
                                      pass: formTutor['pass'].toString(),
                                      region: formTutor['region'].toString(),
                                      telefono:
                                          formTutor['telefono'].toString(),
                                      latitud: double.parse(
                                          formTutor['lat'].toString()),
                                      longitud: double.parse(
                                          formTutor['lng'].toString()));
                                  Usuario user = usuarioBloc.state.usuario!;
                                  user.tutor = tutor;
                                  usuarioBloc
                                      .add(CargaTutorUsuario(user.tutor!));
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
        formTutor['calle_numero'] = suggestion.context?.address?.name ?? '';
        if (suggestion.context?.address?.name != null) {
          _cargaUbicaiones(suggestion.context?.address?.name ?? '');
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
          formTutor['calle_numero'] = value;
          _cargaUbicaiones(value);
        }
      },
      onSaved: (value) {
        formTutor['calle_numero'] = value ?? '';
        if (value != null) {
          _cargaUbicaiones(value);
        }
      },
    );
  }

  _cargaUbicaiones(String direccion) async {
    UbicacionMapbox? mp = await ubicacionespService.getUbicaciones(direccion);
    for (FeatureMap ub in mp?.features ?? []) {
      formTutor['lat'] = ub.geometry!.coordinates![1];
      formTutor['lng'] = ub.geometry!.coordinates![0];
    }
  }
}
