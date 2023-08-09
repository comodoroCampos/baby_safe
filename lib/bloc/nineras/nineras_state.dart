part of 'nineras_bloc.dart';

@immutable
abstract class NinerasState {
  final List<Ninera>? nineras;
  const NinerasState(this.nineras);
}

class NinerasInitial extends NinerasState {
  const NinerasInitial() : super(null);
}

class SetNinera extends NinerasState {
  final List<Ninera>? newNineras;
  const SetNinera(this.newNineras) : super(newNineras);
}
