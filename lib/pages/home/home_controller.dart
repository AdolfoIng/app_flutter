import 'package:app_uber1/pages/utils/share_preference.dart';
import 'package:app_uber1/src/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class HomeController {
  BuildContext? context;
  SharedPreference? _sharedPref;
  AuthProvider? _authProvider;
  String? _typeUser;

  Future? init(BuildContext context) async {
    this.context = context;
    _sharedPref = SharedPreference();
    _authProvider = AuthProvider();

    _typeUser = await _sharedPref!.read('typeUser');
    checkUserIsAuth();

    return null;
  }

  void checkUserIsAuth() {
    bool isSigned = _authProvider!.isSignedIn();

    if (isSigned) {
      debugPrint('LOGEADO.  :)');
      if (_typeUser == 'client') {
        Navigator.pushNamedAndRemoveUntil(
            context!, 'client/map', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context!, 'driver/map', (route) => false);
      }
    } else {
      debugPrint('NO ESTA LOGEADO :(');
    }
  }

  void goToLoginPage(String typeUser) {
    saveTypeUser(typeUser);
    Navigator.pushNamed(context!, 'login');
  }

  saveTypeUser(String typeUser) async {
    await _sharedPref!.save('typeUser', typeUser);
  }
}
