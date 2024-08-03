import 'package:flutter/material.dart';
import 'package:mobile_app/screens/CV_screen.dart';
import 'package:mobile_app/screens/GalleryScreen.dart';
import 'package:mobile_app/screens/black_jack.dart';
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
    const GalleryScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.browse_gallery), label: 'Галлерея'),
        ],
        currentIndex: selectedWidgetsIndex,
        selectedItemColor: Colors.cyan,
        backgroundColor: Color(0x00ffffff), // transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        elevation: 0, // to get rid of the shadow
        onTap: (index) {
          setState(() {
            selectedWidgetsIndex = index;
          });
        },
      ),
    );
  }
}
