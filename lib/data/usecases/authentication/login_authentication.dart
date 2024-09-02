import 'package:projeto_tcc_flutter/session.dart';

import '../../../domain/domain.dart';
import '../../http/http.dart';
import '../../models/models.dart';
class LoginAuthentication implements Authentication {
  final HttpClient httpClient;
  final String url;

  LoginAuthentication({
    required this.httpClient,
    required this.url
  });

  @override
  Future<UserEntity> auth(AuthenticationParams params) async {
    final body = LoginAuthenticationParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
      final user = UserLoginModel.fromJson(httpResponse).toEntity();
      Session.idUsuario = user.idUsuario;
      return user;
    } on HttpError catch(error) {
      throw error == HttpError.notFound
        ? DomainError.userNotFound
        : DomainError.unexpected;
    }
  }
}

class LoginAuthenticationParams {
  final String email;
  final String password;

  LoginAuthenticationParams({
    required this.email,
    required this.password
  });

  factory LoginAuthenticationParams.fromDomain(AuthenticationParams params) => 
    LoginAuthenticationParams(email: params.email, password: params.password);

  Map toJson() => {'login': email, 'senha': password};
}