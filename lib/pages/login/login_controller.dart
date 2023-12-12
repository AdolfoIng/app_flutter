import 'package:app_uber1/pages/utils/share_preference.dart';
import 'package:app_uber1/pages/utils/snackbar.dart' as utils;
import 'package:app_uber1/src/providers/auth_provider.dart';
import 'package:app_uber1/src/providers/client_provider.dart';
import 'package:app_uber1/src/providers/driver_provider.dart';
import 'package:flutter/material.dart';

class LoginController {
  BuildContext? context;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthProvider? _authProvider;

  SharedPreference? _sharedPref;
  String? _typeUser;

  // PROVIDERS
  DriverProvider? _driverProvider;
  ClientProvider? _clientProvider;

  Future? init(BuildContext context) async {
    this.context = context;
    _authProvider = AuthProvider();
    _driverProvider = DriverProvider();
    _clientProvider = ClientProvider();

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

    try {
      bool isLogin = await _authProvider!.login(email, password);

      if (isLogin) {
        debugPrint('ENCONTRADO....');

        if (_typeUser == 'client') {
          bool verificarCuenta = await _clientProvider!
              .getByIdVerificar(_authProvider!.getUser().uid);

          if (verificarCuenta) {
            Navigator.pushNamedAndRemoveUntil(
                context!, 'client/map', (route) => false);
          } else {
            debugPrint('USUARIO NO EXISTE');
            utils.Snackbar.showSnackbar(context!, key,
                'El Cliente no exite crea una cuenta de Cliente');
            await _authProvider!.signOut();
          }
        } else {
          if (_typeUser == 'driver') {
            bool verificarCuenta = await _driverProvider!
                .getByIdVerificar(_authProvider!.getUser().uid);

            if (verificarCuenta) {
              Navigator.pushNamedAndRemoveUntil(
                  context!, 'driver/map', (route) => false);
            } else {
              debugPrint('USUARIO NO EXISTE');
              utils.Snackbar.showSnackbar(
                  context!, key, 'El Driver no existe crea una cuenta!!');
              await _authProvider!.signOut();
            }
          } else {
            debugPrint('TYPEUSER NO ES EXISTE');
          }
        }
      } else {
        utils.Snackbar.showSnackbar(
            context!, key, 'El user no se pudo autenticar');
      }
    } catch (error) {
      print('Error final : $error');
    }
  }
}
