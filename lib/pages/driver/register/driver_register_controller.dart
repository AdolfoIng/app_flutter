import 'package:app_uber1/pages/utils/snackbar.dart';
import 'package:app_uber1/src/models/driver.dart';
import 'package:app_uber1/src/providers/auth_provider.dart';
import 'package:app_uber1/src/providers/driver_provider.dart';
import 'package:flutter/material.dart';

import 'package:app_uber1/pages/utils/snackbar.dart' as utils;

class DriverRegisterController {
  BuildContext? context;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // PLACA
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController pin5Controller = TextEditingController();
  TextEditingController pin6Controller = TextEditingController();
  TextEditingController pin7Controller = TextEditingController();

  AuthProvider? _authProvider;
  DriverProvider? _driverProvider;

  Future? init(BuildContext context) {
    this.context = context;
    _authProvider = AuthProvider();
    _driverProvider = DriverProvider();
    return null;
  }

  void registerUser() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    //PLACA

    String pin1 = pin1Controller.text.trim();
    String pin2 = pin2Controller.text.trim();
    String pin3 = pin3Controller.text.trim();
    String pin4 = pin4Controller.text.trim();
    String pin5 = pin5Controller.text.trim();
    String pin6 = pin6Controller.text.trim();
    String pin7 = pin7Controller.text.trim();

    String placa = '$pin1$pin2$pin3$pin4$pin5$pin6$pin7';

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

        Driver driver = Driver(
            id: _authProvider!.getUser().uid,
            email: _authProvider!.getUser().email!,
            username: username,
            password: password,
            placa: placa);

        await _driverProvider!.create(driver);

        Navigator.pushNamedAndRemoveUntil(
            context!, 'driver/map', (route) => false);

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
