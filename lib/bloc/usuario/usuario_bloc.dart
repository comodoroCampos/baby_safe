import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/usuario.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(const UsuarioInitial()) {
    on<IniciaUsuario>((event, emit) {
      emit(SetUsuario(event.usuario));
    });
  }
}
