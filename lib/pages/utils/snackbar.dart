import 'package:flutter/material.dart';
import 'package:app_uber1/pages/utils/colors.dart' as utils;

class Snackbar {
  static void showSnackbar(
      BuildContext context, GlobalKey<ScaffoldState> key, String text) {
    if (key.currentState == null) return;

    FocusScope.of(context).requestFocus(FocusNode());

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        backgroundColor: utils.Colors.uberCloneColor,
        duration: const Duration(seconds: 3)));
  }
}
