import 'package:baby_safe/pages/nineras/pages/registro_ninera.dart';
import 'package:baby_safe/pages/registrar/pages/registrar.dart';
import 'package:baby_safe/pages/tutores/pages/registro_tutor.dart';
import 'package:flutter/material.dart';

import 'pages/login/pages/login_page.dart';
import 'pages/nineras/pages/ninera_list.dart';

class AppRouter {
  static const inicialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (context) => LoginPage(),
    'registrar_usuario': (context) => RegistrarUsuario(),
    'registro_ninera': (context) => RegistroNineraPage(),
    'ninera_list': (context) => NinerasPage(),
    'registro_tutor': (context) => RegistroTutorPage(),
  };
}
