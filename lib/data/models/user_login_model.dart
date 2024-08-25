import 'package:projeto_tcc_flutter/domain/domain.dart';

import '../http/http.dart';

class UserLoginModel {
  final int idUsuario;
  final String login;
  final String senha;
  final bool administrador;

  UserLoginModel({
    required this.idUsuario,
    required this.login,
    required this.senha,
    required this.administrador,
  });

  factory UserLoginModel.fromJson(Map json) {
    if (json.containsKey('null')) {
      throw HttpError.notFound;
    }
    return UserLoginModel(
      idUsuario: json['idUsuario'],
      login: json['login'],
      senha: json['senha'],
      administrador: json['administrador'],
    );
  }

  UserEntity toEntity() => UserEntity(
    idUsuario: idUsuario,
    login: login,
    senha: senha,
    administrador: administrador,
  );
}
