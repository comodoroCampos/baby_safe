part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioState {
  final Usuario? usuario;
  const UsuarioState(this.usuario);
}

class UsuarioInitial extends UsuarioState {
  const UsuarioInitial() : super(null);
}

class SetUsuario extends UsuarioState {
  final Usuario? newUsuario;
  const SetUsuario(this.newUsuario) : super(newUsuario);
}
