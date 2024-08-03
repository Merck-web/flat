import 'package:flutter/material.dart';
import 'package:mobile_app/screens/CV_screen.dart';
import 'package:mobile_app/screens/black_jack.dart';
import 'package:mobile_app/screens/layout_screen.dart';
import 'package:mobile_app/screens/meditation_app_screen.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int selectedWidgetsIndex = 0;

  List<Widget> widgets = [
    const MeditationAppScreen(),
    const BlackJack(),
    const CvScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Навигация по тестовым приложениям"),
      ),
      body: IndexedStack(
        index: selectedWidgetsIndex,
        children: widgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.mediation), label: 'Музыка'),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Играть'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_view_day), label: 'CV'),
        ],
        currentIndex: selectedWidgetsIndex,
        selectedItemColor: Colors.cyan,
        onTap: (index) {
          setState(() {
            selectedWidgetsIndex = index;
          });
        },
      ),
    );
  }
}
