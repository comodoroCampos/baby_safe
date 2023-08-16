import 'package:baby_safe/bloc/usuario/usuario_bloc.dart';
import 'package:baby_safe/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../nineras/input/input_string_ninera.dart';
import '../../nineras/input/select_item_ninera.dart';

class RegistrarUsuario extends StatelessWidget {
  RegistrarUsuario({super.key});
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final Map<String, Object> formRegistroUsuario = {
    'mail': '',
    'usuario': '',
    'pass': '',
    'perfil': ''
  };
  String? variable;

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Registro De Usuario',
                style: TextStyle(fontSize: 16)),
            backgroundColor: const Color.fromARGB(198, 247, 3, 166),
          ),
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
                                formProperty: 'usuario',
                                suffixIcon: Icons.search_outlined,
                                labelText: 'Nombre usuario',
                                msjValidacion: 'Ingrese nombre usuario',
                                soloLectura: false,
                                valorInicial: '',
                                formValues: formRegistroUsuario),
                            InputStringNinera(
                                lineas: 1,
                                width: double.infinity,
                                obscureText: false,
                                requerido: true,
                                formProperty: 'mail',
                                suffixIcon: Icons.search_outlined,
                                labelText: 'Email',
                                msjValidacion: 'Ingrese email',
                                soloLectura: false,
                                valorInicial: '',
                                formValues: formRegistroUsuario),
                            InputStringNinera(
                                lineas: 1,
                                width: double.infinity,
                                obscureText: true,
                                requerido: true,
                                formProperty: 'pass',
                                suffixIcon: Icons.search_outlined,
                                labelText: 'Contraseña',
                                msjValidacion: 'Ingrese contraseña',
                                soloLectura: false,
                                valorInicial: '',
                                formValues: formRegistroUsuario),
                            DropdownButtonFormField<String>(
                                value: 'Seleccione',
                                focusColor: Colors.black,
                                decoration: const InputDecoration(
                                    labelText: 'Perfil de Usuario',
                                    fillColor: Colors.black,
                                    focusColor: Colors.black,
                                    isDense: true),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Seleccione el perfil';
                                  }
                                  if (value == 'Seleccione') {
                                    return 'Seleccione el perfil';
                                  }
                                  return null;
                                },
                                items: getListaSelectNinera(
                                    ['Seleccione', 'Niñera', 'Tutor']),
                                onChanged: (value) {
                                  formRegistroUsuario['perfil'] =
                                      value ?? 'Seleccione';
                                  variable = value;
                                }),
                          ])),
                  Container(
                      height: 40,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 15, 145, 95),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: TextButton(
                          child: const Text(
                            "Siguiente",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (myFormKey.currentState!.validate()) {
                              usuarioBloc.add(IniciaUsuario(Usuario(
                                  correo:
                                      formRegistroUsuario['nombre'].toString(),
                                  perfil:
                                      formRegistroUsuario['perfil'].toString(),
                                  pass: formRegistroUsuario['pass'].toString(),
                                  usuario:
                                      formRegistroUsuario['usuario'].toString(),
                                  permisos: [])));
                              if (variable == 'Tutor') {
                                Navigator.pushNamed(context, 'registro_tutor');
                              } else if (variable == 'Niñera') {
                                Navigator.pushNamed(context, 'registro_ninera');
                              }
                            }
                            //mesaje
                          })),
                ],
              ),
            ),
          ))),
    );
  }
}
