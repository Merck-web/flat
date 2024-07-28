import 'package:flutter/material.dart';

class BlackJack extends StatefulWidget {
  const BlackJack({super.key});

  @override
  _BlackJackState createState() => _BlackJackState();
}

class _BlackJackState extends State<BlackJack> {
  bool isGameStart = false;

  List<Image> myCards = [];
  List<Image> dealersCards = [];

  String? dealersFirstCard;
  String? dealersSecondCard;

  String? playersFirstCard;
  String? playersSecondCard;

  int playScore = 0;
  int dealerScore = 0;

  final Map<String, int> deckOfCards = {
    "2.1.png": 2,
    "2.2.png": 2,
    "2.3.png": 2,
    "2.4.png": 2,
    "3.1.png": 3,
    "3.2.png": 3,
    "3.3.png": 3,
    "3.4.png": 3,
    "4.1.png": 4,
    "4.2.png": 4,
    "4.3.png": 4,
    "4.4.png": 4,
    "5.1.png": 5,
    "5.2.png": 5,
    "5.3.png": 5,
    "5.4.png": 5,
    "6.1.png": 6,
    "6.2.png": 6,
    "6.3.png": 6,
    "6.4.png": 6,
    "7.1.png": 7,
    "7.2.png": 7,
    "7.3.png": 7,
    "7.4.png": 7,
    "8.1.png": 8,
    "8.2.png": 8,
    "8.3.png": 8,
    "8.4.png": 8,
    "9.1.png": 9,
    "9.2.png": 9,
    "9.3.png": 9,
    "9.4.png": 9,
    "10.1.png": 10,
    "10.2.png": 10,
    "10.3.png": 10,
    "10.4.png": 10,
    "J1.png": 10,
    "J2.png": 10,
    "J3.png": 10,
    "J4.png": 10,
    "Q1.png": 10,
    "Q2.png": 10,
    "Q3.png": 10,
    "Q4.png": 10,
    "K1.png": 10,
    "K2.png": 10,
    "K3.png": 10,
    "K4.png": 10,
    "A1.png": 11,
    "A2.png": 11,
    "A3.png": 11,
    "A4.png": 11,
  };

  Map<String, int> playingCards = {};

  @override
  void initState() {
    super.initState();
    playingCards.addAll(deckOfCards);
  }

  void startGame() {
    setState(() {
      isGameStart = true;
    });
  }

  void addCard() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isGameStart == true
          ? SafeArea(
              child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Карты дилера
                  Column(
                    children: [
                      Text("Счет дилера $dealerScore"),
                      SizedBox(
                        height: 28,
                      )
                    ],
                  ),
                  // Наши карты
                  Column(
                    children: [
                      Text("Счет $playScore"),
                      SizedBox(
                        height: 28,
                      )
                    ],
                  ),
                  // Колонка action
                  Column(
                    children: [
                      MaterialButton(child: Text('Дргую карту'), onPressed: addCard),
                      MaterialButton(child: Text('Следующий раунд'), onPressed: null),
                    ],
                  ),
                ],
              ),
            ))
          : Center(
              child: MaterialButton(
                onPressed: startGame,
                child: const Text('Начать игру'),
              ),
            ),
    );
  }
}
