import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../widgets/side_bar.dart';
import 'flashcard_page.dart';

class SubtractionPage extends StatefulWidget {
  const SubtractionPage({Key? key}) : super(key: key);

  @override
  State<SubtractionPage> createState() => _SubtractionPageState();
}

class _SubtractionPageState extends State<SubtractionPage> {
  List subtraction = [];

  Future<void> readData(String path) async {
    final String response = await rootBundle.loadString(path);
    final data = await json.decode(response);
    setState(() {
      subtraction = data['subtraction'];
    });
  }

  @override
  void initState() {
    readData('models/subtraction.json');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subtraction Board')),
      body: Container(
        color: Colors.orange.shade100,
        margin: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const Sidebar(),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  FlipCardPage(flashcards: subtraction),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
