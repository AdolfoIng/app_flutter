import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final Color color;
  final String texto;
  final Function onPresed;
  const ButtonApp(
      {super.key,
      required this.color,
      required this.texto,
      required this.onPresed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black87, // foreground
      ),
      onPressed: () {
        onPresed();
      },
      child: Text(texto),
    );
  }
}
