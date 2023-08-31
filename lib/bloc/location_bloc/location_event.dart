part of 'location_bloc.dart';

@immutable
abstract class LocacionEvent {
  const LocacionEvent();
}

class OnNewUserLocationEvent extends LocacionEvent {
  final Locacion locacion;
  const OnNewUserLocationEvent(this.locacion);
}

class OnNuevaLocacion extends LocacionEvent {
  final LatLng lng;
  const OnNuevaLocacion(this.lng);
}

class OnStartFollowingUser extends LocacionEvent {}

class OnStopFollowingUser extends LocacionEvent {}
