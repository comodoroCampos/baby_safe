part of 'mapa_bloc.dart';

abstract class MapaEvent extends Equatable {
  const MapaEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitialzedEvent extends MapaEvent {
  final GoogleMapController controller;
  const OnMapInitialzedEvent(this.controller);
}
