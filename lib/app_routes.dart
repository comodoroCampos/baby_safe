import 'package:flutter/material.dart';

import 'login/pages/login_page.dart';

class AppRouter {
  static const inicialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (context) => const LoginPage(),
  };
}
