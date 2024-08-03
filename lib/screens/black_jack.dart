import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/ButtonDefault.dart';
import '../widgets/CardGridWidget.dart';

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
    "assets/images/cards/2.1.png": 2,
    "assets/images/cards/2.2.png": 2,
    "assets/images/cards/2.3.png": 2,
    "assets/images/cards/2.4.png": 2,
    "assets/images/cards/3.1.png": 3,
    "assets/images/cards/3.2.png": 3,
    "assets/images/cards/3.3.png": 3,
    "assets/images/cards/3.4.png": 3,
    "assets/images/cards/4.1.png": 4,
    "assets/images/cards/4.2.png": 4,
    "assets/images/cards/4.3.png": 4,
    "assets/images/cards/4.4.png": 4,
    "assets/images/cards/5.1.png": 5,
    "assets/images/cards/5.2.png": 5,
    "assets/images/cards/5.3.png": 5,
    "assets/images/cards/5.4.png": 5,
    "assets/images/cards/6.1.png": 6,
    "assets/images/cards/6.2.png": 6,
    "assets/images/cards/6.3.png": 6,
    "assets/images/cards/6.4.png": 6,
    "assets/images/cards/7.1.png": 7,
    "assets/images/cards/7.2.png": 7,
    "assets/images/cards/7.3.png": 7,
    "assets/images/cards/7.4.png": 7,
    "assets/images/cards/8.1.png": 8,
    "assets/images/cards/8.2.png": 8,
    "assets/images/cards/8.3.png": 8,
    "assets/images/cards/8.4.png": 8,
    "assets/images/cards/9.1.png": 9,
    "assets/images/cards/9.2.png": 9,
    "assets/images/cards/9.3.png": 9,
    "assets/images/cards/9.4.png": 9,
    "assets/images/cards/10.1.png": 10,
    "assets/images/cards/10.2.png": 10,
    "assets/images/cards/10.3.png": 10,
    "assets/images/cards/10.4.png": 10,
    "assets/images/cards/J1.png": 10,
    "assets/images/cards/J2.png": 10,
    "assets/images/cards/J3.png": 10,
    "assets/images/cards/J4.png": 10,
    "assets/images/cards/Q1.png": 10,
    "assets/images/cards/Q2.png": 10,
    "assets/images/cards/Q3.png": 10,
    "assets/images/cards/Q4.png": 10,
    "assets/images/cards/K1.png": 10,
    "assets/images/cards/K2.png": 10,
    "assets/images/cards/K3.png": 10,
    "assets/images/cards/K4.png": 10,
    "assets/images/cards/A1.png": 11,
    "assets/images/cards/A2.png": 11,
    "assets/images/cards/A3.png": 11,
    "assets/images/cards/A4.png": 11,
  };

  Map<String, int> playingCards = {};

  @override
  void initState() {
    super.initState();
    playingCards.addAll(deckOfCards);
  }

  String getRandomCard () {
    Random random = Random();
    int randomIndex  = random.nextInt(playingCards.length);
    String cardIndex = playingCards.keys.elementAt(randomIndex);
    playingCards.removeWhere((key,value) => key == cardIndex);
    return cardIndex;
  }

  void startGame() {
    setState(() {
      isGameStart = true;
    });
    
    myCards = [];
    dealersCards = [];
    playingCards = {};
    playingCards.addAll(deckOfCards);

    dealersFirstCard = getRandomCard();
    dealersSecondCard = getRandomCard();

    playersFirstCard = getRandomCard();
    playersSecondCard = getRandomCard();

    dealersCards.add(Image.asset(dealersFirstCard ?? 'assets/another-image.png'));
    dealersCards.add(Image.asset(dealersSecondCard!));

    dealerScore = (deckOfCards[dealersFirstCard] ?? 1) + (deckOfCards[dealersSecondCard] ?? 1);

    myCards.add(Image.asset(playersFirstCard ?? 'assets/another-image.png'));
    myCards.add(Image.asset(playersSecondCard!));
    playScore = (deckOfCards[playersFirstCard] ?? 1) + (deckOfCards[playersSecondCard] ?? 1);
  }

  void addCard() {
    if (playingCards.isEmpty) {
      return;
    }

    String additionalCardOne = getRandomCard();

    setState(() {
      myCards.add(Image.asset(additionalCardOne));
    });

    playScore = playScore + deckOfCards[additionalCardOne]!;

    if (dealerScore <= 14) {
      String additionalCardTwo = getRandomCard();
      setState(() {
        dealersCards.add(Image.asset(additionalCardTwo));
      });
      dealerScore = dealerScore + deckOfCards[additionalCardTwo]!;
    }
  }

  Color dealerColor() {
    bool autoLoose = !(dealerScore > 21);
    bool autoWin = playScore > 21;
    bool win = playScore <= 21 && dealerScore > playScore;

    if ((autoWin || win) && autoLoose) {
      return Colors.green[800]!;
    } else {
      return Colors.red[800]!;
    }
  }

  Color playerColor() {
    bool autoLoose = !(playScore > 21);
    bool autoWin = dealerScore > 21;
    bool win = playScore <= 21 && playScore > dealerScore;

    if ((autoWin || win) && autoLoose) {
      return Colors.green[800]!;
    } else {
      return Colors.red[800]!;
    }
  }

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
                      Text(
                        "Счет дилера $dealerScore",
                        style: TextStyle(
                          color: dealerColor(),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      CardGridWidget(cards: dealersCards),
                    ],
                  ),
                  // Наши карты
                  Column(
                    children: [
                      Text(
                          "Ваш счет $playScore",
                        style: TextStyle(
                          color: playerColor(),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      CardGridWidget(cards: myCards),
                    ],
                  ),
                  // Колонка action
                  IntrinsicWidth(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Buttondefault(
                            color: Colors.brown,
                            onPressed: addCard,
                            text: 'Другую карту'
                        ),
                        Buttondefault(
                            color: Colors.amber,
                            onPressed: startGame,
                            text: 'Следующий раунд'
                        ),
                      ],
                    ),
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

