import 'package:app_uber1/pages/utils/snackbar.dart';
import 'package:app_uber1/src/models/client.dart';
import 'package:app_uber1/src/providers/auth_provider.dart';
import 'package:app_uber1/src/providers/client_provider.dart';
import 'package:flutter/material.dart';

import 'package:app_uber1/pages/utils/snackbar.dart' as utils;

class ClientRegisterController {
  BuildContext? context;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  AuthProvider? _authProvider;
  ClientProvider? _clientProvider;

  Future? init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _clientProvider = ClientProvider();
    return null;
  }

  void registerUser() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    debugPrint('Username: $username');
    debugPrint('Email: $email');
    debugPrint('Passw: $password');
    debugPrint('Confirm Passw: $confirmPassword');

    if (confirmPassword != password) {
      debugPrint('revisar password');
      Snackbar.showSnackbar(context!, key, 'Las contraseñas no son iguales');
      return;
    }

    if (password.length < 6) {
      debugPrint('password debe tener al menos 6 caracteres');
      Snackbar.showSnackbar(
          context!, key, 'La contraseña debe tener al menos 6 caracteres');
      return;
    }

    try {
      bool isRegister = await _authProvider!.register(email, password);

      if (isRegister) {
        debugPrint('Register succesfull ..');

        Client client = Client(
            id: _authProvider!.getUser().uid,
            email: _authProvider!.getUser().email!,
            username: username,
            password: password);

        await _clientProvider!.create(client);

        Navigator.pushNamedAndRemoveUntil(
            context!, 'client/map', (route) => false);

        utils.Snackbar.showSnackbar(
            context!, key, 'El se Registro correctamente');
      } else {
        debugPrint('Ocurrio an error ');
      }
    } catch (error) {
      debugPrint('Error final : $error');
    }
  }
}
