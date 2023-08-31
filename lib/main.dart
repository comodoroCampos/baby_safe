import 'package:baby_safe/bloc/map_bloc/mapa_bloc.dart';
import 'package:baby_safe/bloc/nineras/nineras_bloc.dart';
import 'package:baby_safe/bloc/tutor/tutor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_routes.dart';
import 'bloc/location_bloc/location_bloc.dart';
import 'bloc/usuario/usuario_bloc.dart';
import 'config/theme/app_theme.dart';

Future<void> main() async {
  runApp(const MyApp());
  // runApp(const MyApp())
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TutorBloc(),
        ),
        BlocProvider(
          create: (context) => NinerasBloc(),
        ),
        BlocProvider(
          create: (context) => UsuarioBloc(),
        ),
        BlocProvider(
          create: (context) => MapaBloc(),
        ),
        BlocProvider(
          create: (context) => LocacionBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Baby Safe',
        theme: AppTheme().theme(),
        initialRoute: AppRouter.inicialRoute,
        routes: AppRouter.routes,
      ),
    );
  }
}
