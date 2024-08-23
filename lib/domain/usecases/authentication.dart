import 'package:equatable/equatable.dart';

import '../domain.dart';

abstract class Authentication {
  Future<UserEntity> auth(AuthenticationParams params);
}

class AuthenticationParams extends Equatable {
  final String email;
  final String password;

  @override
  List get props => [email, password];

  const AuthenticationParams({ required this.email, required this.password });
}