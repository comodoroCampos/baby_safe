import 'package:baby_safe/models/ninera.dart';
import 'package:baby_safe/models/tutor.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/usuario.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(const UsuarioInitial()) {
    on<IniciaUsuario>((event, emit) {
      emit(SetUsuario(event.usuario));
    });
    on<CargaTutorUsuario>((event, emit) {
      if (state.usuario == null) return;
      emit(SetUsuario(state.usuario?.copyWith(tutor: event.tutor)));
    });
    on<CargaNineraUsuario>((event, emit) {
      if (state.usuario == null) return;
      emit(SetUsuario(state.usuario?.copyWith(ninera: event.ninera)));
    });
  }
}
