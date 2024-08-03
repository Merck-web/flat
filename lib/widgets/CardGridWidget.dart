import 'package:flutter/material.dart';

class CardGridWidget extends StatelessWidget {
  const CardGridWidget({
    super.key,
    required this.cards,
  });

  final List<Image> cards;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: cards[index],
            );
          }
      ),
    );
  }
}
