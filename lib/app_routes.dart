import 'package:baby_safe/pages/nineras/pages/registro_ninera.dart';
import 'package:flutter/material.dart';

import 'pages/login/pages/login_page.dart';

class AppRouter {
  static const inicialRoute = 'registro_ninera';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (context) => LoginPage(),
    'registro_ninera': (context) => RegistroNineraPage(),
  };
}
