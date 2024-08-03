import 'package:flutter/material.dart';

class Buttondefault extends StatelessWidget {

  Buttondefault({
    required this.onPressed,
    required this.text,
    this.color = const Color(0xFFFFE082),
  });

  final Function() onPressed;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: color,
        onPressed: onPressed,
        child: Text(text)
    );
  }
}
