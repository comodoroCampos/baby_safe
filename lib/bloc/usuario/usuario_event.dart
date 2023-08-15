part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class IniciaUsuario extends UsuarioEvent {
  final Usuario? usuario;
  IniciaUsuario(this.usuario);
}
