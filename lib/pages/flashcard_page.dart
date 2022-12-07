import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../widgets/flashcard_view.dart';

class FlipCardPage extends StatefulWidget {
  const FlipCardPage({Key? key, required this.flashcards}) : super(key: key);

  final List flashcards;

  @override
  State<FlipCardPage> createState() => _FlipCardPageState();
}

class _FlipCardPageState extends State<FlipCardPage> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 700,
            height: 450,
            child: FlipCard(
              key: cardKey,
              speed: 200,
              front: Container(
                color: Colors.blue.shade400,
                alignment: Alignment.center,
                child: FlashCardView(
                    text: widget.flashcards[_currentIndex]['question']
                ),
              ),
              back: Container(
                color: Colors.green.shade800,
                alignment: Alignment.center,
                child: FlashCardView(
                  text: widget.flashcards[_currentIndex]['answer'],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                  onPressed: previousCard,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Prev')),
              LinearPercentIndicator(
                width: 750,
                lineHeight: 14,
                percent: _currentIndex / widget.flashcards.length,
                backgroundColor: Colors.blueGrey,
                progressColor: Colors.green,
                animation: true,
                animateFromLastPercent: true,
              ),
              OutlinedButton.icon(
                  onPressed: nextCard,
                  icon: const Icon(Icons.chevron_right),
                  label: const Text('Next')),
            ],
          )
        ],
      ),
    );
  }

  void nextCard() {
    setState(() {
      if (cardKey.currentContext != null) {
        if (!cardKey.currentState!.isFront) {
          cardKey.currentState!.toggleCard();
        }
      }

      if (_currentIndex != widget.flashcards.length - 1) {
        _currentIndex = (_currentIndex + 1 < widget.flashcards.length)
            ? _currentIndex + 1
            : 0;
      } else {
        Get.toNamed('/congratspage');
      }
    },
    );
  }

  void previousCard() {
    setState(() {
      if (cardKey.currentContext != null) {
        if (!cardKey.currentState!.isFront) {
          cardKey.currentState!.toggleCard();
        }
      }

      _currentIndex = (_currentIndex - 1 >= 0)
          ? _currentIndex - 1
          : widget.flashcards.length - 1;
    },
    );
  }
}
