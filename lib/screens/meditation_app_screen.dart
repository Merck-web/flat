import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app/models/item_model.dart';
import 'package:just_audio/just_audio.dart';

class MeditationAppScreen extends StatefulWidget {
  const MeditationAppScreen({super.key});

  @override
  _MeditationAppScreen createState() => _MeditationAppScreen();
}

class _MeditationAppScreen extends State<MeditationAppScreen> {
  final List<ItemModel> items = [
    ItemModel(audioPath: 'assets/audio/forest.mp3', imagePath: 'assets/images/forest.jpeg', name: 'Forest'),
    ItemModel(audioPath: 'assets/audio/night.mp3', imagePath: 'assets/images/night.jpeg', name: 'Night'),
    ItemModel(audioPath: 'assets/audio/ocean.mp3', imagePath: 'assets/images/ocean.jpeg', name: 'Ocean'),
    ItemModel(audioPath: 'assets/audio/waterfall.mp3', imagePath: 'assets/images/waterfall.jpeg', name: 'Waterfall'),
    ItemModel(audioPath: 'assets/audio/wind.mp3', imagePath: 'assets/images/wind.jpeg', name: 'Wind'),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  int? playIndex;

  Widget showIcon(int currentIndex) {
    if (playIndex == currentIndex) {
      return const FaIcon(FontAwesomeIcons.stop);
    } else {
      return const FaIcon(FontAwesomeIcons.play);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(items[index].imagePath),
                      )
                  ),
                  child: ListTile(
                    title: Text(items[index].name, style: TextStyle(color: Colors.white)),
                    leading: IconButton(
                      icon: showIcon(index),
                      color: Colors.white,
                      onPressed:  () async {
                        try {
                          if (playIndex == index) {
                            setState(() {
                              playIndex = null;
                            });
                            audioPlayer.stop();
                          } else {
                            await audioPlayer.setAsset(items[index].audioPath).catchError((onError) {

                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Что то сломалось')));
                              print('error in playAction');
                              print(onError);
                            });
                            audioPlayer.play();

                            setState(() {
                              playIndex = index;
                            });
                          }
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Что то сломалось')));
                          print('error in playAction');
                          print(error);
                          setState(() {
                            playIndex = null;
                          });
                          audioPlayer.stop();
                        }
                      },
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
