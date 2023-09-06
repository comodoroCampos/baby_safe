import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/nineras/nineras_bloc.dart';
import '../../../services/ninera_service.dart';
import '../witget/input_string.dart';
import 'package:baby_safe/utils/medida.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

  Map<String, Object> formValues = {'user': '', 'pass': ''};
  final nineraService = NineraService();
  @override
  Widget build(BuildContext context) {
    Medidas(context);
    final ninerasBloc = BlocProvider.of<NinerasBloc>(context, listen: false);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(
                    'assets/img/wallpaper.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Center(
            //   child: fondoborroso(),
            // ),
            Center(
              child: SingleChildScrollView(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: const Color.fromARGB(90, 3, 145, 102),
                  ),
                  child: fondoborroso(
                    SizedBox(
                      height: Medidas.heigth(100),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Expanded(
                            flex: 8,
                            child: Center(
                              child: Form(
                                key: myFormKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Container(
                                    alignment: Alignment.topCenter,
                                    height: Medidas.heigth(75),
                                    width: Medidas.width(60),
                                    child: Column(children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Baby Safe",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      const Text(
                                        "",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: Medidas.heigth(4),
                                      ),
                                      InputString(
                                          obscureText: false,
                                          requerido: true,
                                          formProperty: 'user',
                                          suffixIcon: Icons.supervisor_account,
                                          labelText: 'Usuario',
                                          msjValidacion: 'usuario obligatorio',
                                          formValues: formValues),
                                      SizedBox(
                                        height: Medidas.heigth(5),
                                      ),
                                      InputString(
                                          obscureText: true,
                                          requerido: true,
                                          formProperty: 'pass',
                                          suffixIcon: Icons.lock_open_outlined,
                                          labelText: 'Password',
                                          msjValidacion:
                                              'contraseña obligatoria',
                                          formValues: formValues),
                                      SizedBox(
                                        height: Medidas.heigth(4),
                                      ),
                                      SizedBox(
                                        height: Medidas.heigth(4),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 243, 6, 128),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: TextButton(
                                            child: const Text(
                                              "Ingresar",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () async {
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());
                                              if (!myFormKey.currentState!
                                                  .validate()) {
                                                return;
                                              }

                                              String user =
                                                  formValues['user'].toString();
                                              String pass =
                                                  formValues['pass'].toString();

                                              try {
                                                final nineras =
                                                    await nineraService
                                                        .getNineras();

                                                ninerasBloc.add(
                                                    IniciaNineras(nineras));

                                                Navigator.pushNamed(
                                                    context, 'mapa_ninera');
                                              } catch (e) {}

                                              //mesaje
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 15, 145, 95),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: TextButton(
                                            child: const Text(
                                              "Registrar",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () async {
                                              FocusScope.of(context)
                                                  .requestFocus(FocusNode());

                                              Navigator.pushNamed(
                                                  context, 'registrar_usuario');

                                              //mesaje
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 60,
                                      ),
                                    ])),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dialogo(BuildContext context, String mensaje) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error al iniciar sesión'),
            content: Text(mensaje),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget fondoborroso(Widget witget) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.passthrough,
        children: [
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF29A710),
                        Color(0xFF0F3311),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.25, 0.90],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12),
                height: Medidas.heigth(78),
                width: Medidas.width(78),
                child: witget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
