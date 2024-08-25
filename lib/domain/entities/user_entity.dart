import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int idUsuario;
  final String login;
  final String senha;
  final bool administrador;

  @override
  List get props => [idUsuario, login, senha, administrador];

  const UserEntity({
    required this.idUsuario,
    required this.login,
    required this.senha,
    required this.administrador,
  });
}