import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'mapa_event.dart';
part 'mapa_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaState> {
  GoogleMapController? _mapController;

  MapaBloc() : super(const MapaState()) {
    on<OnMapInitialzedEvent>(_onInitMap);
  }
  void _onInitMap(OnMapInitialzedEvent event, Emitter<MapaState> emit) {
    emit(state.copyWith(isMapInitialized: true));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }
}
