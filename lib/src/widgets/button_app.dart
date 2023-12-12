import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final Color color;
  final Color colorText;
  final String texto;
  final Function onPresed;
  const ButtonApp(
      {super.key,
      required this.color,
      required this.texto,
      required this.onPresed,
      required this.colorText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorText,
        backgroundColor: color,
      ),
      onPressed: () {
        onPresed();
      },
      child: Text(texto),
    );
  }
}
