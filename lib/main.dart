import 'package:flutter/material.dart';
import 'package:mobile_app/screens/CV_screen.dart';
import 'package:mobile_app/screens/black_jack.dart';
import 'package:mobile_app/screens/layout_screen.dart';
import 'package:mobile_app/screens/meditation_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: BlackJack()
    );
  }
}

