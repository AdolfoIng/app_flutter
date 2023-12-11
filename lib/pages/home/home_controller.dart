import 'package:app_uber1/pages/utils/share_preference.dart';
import 'package:flutter/material.dart';

class HomeController {
  BuildContext? context;
  SharedPreference? _sharedPref;

  Future? init(BuildContext context) {
    this.context = context;
    _sharedPref = SharedPreference();
    return null;
  }

  void goToLoginPage(String typeUser) {
    saveTypeUser(typeUser);
    Navigator.pushNamed(context!, 'login');
  }

  saveTypeUser(String typeUser) async {
    await _sharedPref!.save('typeUser', typeUser);
  }
}
