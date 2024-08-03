import 'package:flutter/material.dart';
import 'package:mobile_app/layouts/NavigationView.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app/provider/GalleryData.dart';
import 'package:provider/provider.dart';

void main() async {
  // Загружаем переменные окружения
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return GalleryData()..getImages();
      },
      child: MaterialApp(
          home: NavigationView()
      ),
    );
  }
}

