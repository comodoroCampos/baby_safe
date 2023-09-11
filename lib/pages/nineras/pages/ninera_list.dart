import 'package:baby_safe/bloc/nineras/nineras_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/menu/menu.dart';
import '../../../services/ninera_service.dart';
import '../widgets/ninera_card_list.dart';

class NinerasPage extends StatelessWidget {
  NinerasPage({super.key});
  final nineraService = NineraService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<NinerasBloc, NinerasState>(
                            builder: (context, bloc) {
                          if (bloc.nineras != null) {
                            return CardNineraList(nineras: bloc.nineras!);
                          }
                          return Container();
                        })
                      ],
                    )))));
  }
}
