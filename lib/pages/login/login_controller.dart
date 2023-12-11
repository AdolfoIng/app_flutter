import 'package:app_uber1/pages/utils/share_preference.dart';
import 'package:app_uber1/src/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginController {
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthProvider? _authProvider;

  SharedPreference? _sharedPref;
  String? _typeUser;

  Future? init(BuildContext context) async {
    this.context = context;
    _authProvider = AuthProvider();
    _sharedPref = SharedPreference();
    _typeUser = await _sharedPref!.read('typeUser');

    debugPrint(' ***  TYPEUSER ***');
    debugPrint(_typeUser);
    return null;
  }

  void goToRegisterPage() {
    if (_typeUser == 'client') {
      Navigator.pushNamed(context!, 'client/register');
    } else {
      Navigator.pushNamed(context!, 'driver/register');
    }
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: $email');
    print('Passw: $password');

    try {
      bool isLogin = await _authProvider!.login(email, password);

      if (isLogin) {
        print('Logueado exito ..');
      } else {
        print('Ocurrio an error ');
      }
    } catch (error) {
      print('Error final : $error');
    }
  }
}
