import 'package:baby_safe/bloc/tutor/tutor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_routes.dart';

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
      ],
      child: MaterialApp(
        title: 'Baby Safe',
        initialRoute: AppRouter.inicialRoute,
        routes: AppRouter.routes,
      ),
    );
  }
}
