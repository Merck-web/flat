import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/layouts/NavigationView.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app/provider/GalleryData.dart';
import 'package:provider/provider.dart';
import 'cubit/GalleryCubit.dart';

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
    // Вариант с Provider
    // return ChangeNotifierProvider(
    //   create: (BuildContext context) {
    //     return GalleryData()..getImages();
    //   },
    //   child: MaterialApp(
    //       home: NavigationView()
    //   ),
    // );
    // Вариант с Cubit
    return BlocProvider(
      create: (context) => GalleryCubit()..getImages(),
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: Color(0xFF334257),
            colorScheme: ColorScheme.dark().copyWith(
              primary: Color(0xFF156BE3),
              secondary: Color(0xFF15E3B3),
            ),
          ),
          home: NavigationView()
      ),
    );
  }
}

