import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocacionBloc extends Bloc<LocacionEvent, LocacionState> {
  StreamSubscription<Position>? positionStream;

  LocacionBloc() : super(const LocacionInitial()) {
    on<OnNewUserLocationEvent>((event, emit) {
      emit(const LocacionInitial());
    });

    on<OnNuevaLocacion>((event, emit) {
      // if (state.locacion.lastKnownLocation == null) return;
      final rutas = [...state.locacion.myLocationHistory, event.lng];
      emit(SetLocation(state.locacion
          .copyWith(myLocationHistory: rutas, lastKnownLocation: event.lng)));
    });
    on<OnStartFollowingUser>((event, emit) {
      emit(SetLocation(state.locacion.copyWith(followingUser: true)));
    });
    on<OnStopFollowingUser>((event, emit) {
      emit(SetLocation(state.locacion.copyWith(followingUser: false)));
    });
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    add(OnNuevaLocacion(LatLng(position.latitude, position.longitude)));
  }

  void startFollowingUser() {
    add(OnStartFollowingUser());

    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      add(OnNuevaLocacion(LatLng(position.latitude, position.longitude)));
    });
  }

  void stopFollowingUser() {
    positionStream?.cancel();
    add(OnStopFollowingUser());
    if (kDebugMode) {
      print('stopFollowingUser');
    }
  }

  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
