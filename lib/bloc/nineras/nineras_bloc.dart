import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/ninera.dart';

part 'nineras_event.dart';
part 'nineras_state.dart';

class NinerasBloc extends Bloc<NinerasEvent, NinerasState> {
  NinerasBloc() : super(const NinerasInitial()) {
    on<IniciaNineras>((event, emit) {
      emit(SetNinera(event.nineras));
    });
  }
}
