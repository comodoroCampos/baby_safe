part of 'location_bloc.dart';

@immutable
abstract class LocacionState {
  final Locacion locacion;

  const LocacionState({required this.locacion});
}

class LocacionInitial extends LocacionState {
  const LocacionInitial()
      : super(
            locacion:
                const Locacion(followingUser: true, myLocationHistory: []));
}

class SetLocation extends LocacionState {
  final Locacion newLocacion;

  const SetLocation(this.newLocacion) : super(locacion: newLocacion);
}
