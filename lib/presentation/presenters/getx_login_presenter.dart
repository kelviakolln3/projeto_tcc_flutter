import 'package:get/get.dart';
import '../../ui/ui.dart';
import '../../domain/domain.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter{
  final Authentication authentication;

  GetxLoginPresenter({
    required this.authentication,
  });

  final _emailError = Rx<String?>(null);
  final _passwordError = Rx<String?>(null);
  final _loginError = Rx<String?>(null);

  String? _email;
  String? _password;

  @override
  Stream<String?> get emailErrorStream => _emailError.stream;
  @override
  Stream<String?> get passwordErrorStream => _passwordError.stream;
  @override
  Stream<String?> get loginErrorStream => _loginError.stream;

  @override
  void validateEmail(String? email) {
    _emailError.value = null;
    _email = email;
    if(!_email!.contains("@")) _emailError.value = "Informe um e-mail valido";
  }

  @override
  void validatePassword(String? password) {
    _passwordError.value = null;
    _password = password;
    if(_password == '') _passwordError.value = "Informe uma senha";
  }

  @override
  void auth() async {
    /* if(_email != null && _password != null){
      final user = await authentication.auth(AuthenticationParams(email: _email!, password: _password!));
      if(user.idUsuario != null){ */
        Get.toNamed('/home');
      /* }
    } else{
      _loginError.value = "Usuário ou senha inválida \n Verifique";
    } */
  }
}