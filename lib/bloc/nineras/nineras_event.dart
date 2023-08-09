part of 'nineras_bloc.dart';

@immutable
abstract class NinerasEvent {}

class IniciaNineras extends NinerasEvent {
  final List<Ninera>? nineras;
  IniciaNineras(this.nineras);
}
