import 'package:flutter/material.dart';
import 'package:mobile_app/layouts/NavigationView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: NavigationView()
    );
  }
}

