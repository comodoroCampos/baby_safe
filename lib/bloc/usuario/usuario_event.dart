part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class IniciaUsuario extends UsuarioEvent {
  final Usuario? usuario;
  IniciaUsuario(this.usuario);
}

class CargaTutorUsuario extends UsuarioEvent {
  final Tutor? tutor;
  CargaTutorUsuario(this.tutor);
}

class CargaNineraUsuario extends UsuarioEvent {
  final Ninera ninera;
  CargaNineraUsuario(this.ninera);
}
