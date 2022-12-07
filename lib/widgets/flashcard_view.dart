import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  final String text;

  const FlashCardView({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 750,
      child: Card(
        elevation: 8,
        child: Center(
          child: Text(
            text, 
            textAlign: TextAlign.center,
            style: Theme.of(context)
            .textTheme.headlineLarge!
            .copyWith(
              fontSize: 100,
              color: Colors.brown.shade700,
              fontWeight: FontWeight.bold,
            ),),
        ),
      ),
    );
  }
}