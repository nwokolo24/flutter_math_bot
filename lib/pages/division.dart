import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../widgets/side_bar.dart';
import 'flashcard_page.dart';

class DivisionPage extends StatefulWidget {
  const DivisionPage({Key? key}) : super(key: key);

  @override
  State<DivisionPage> createState() => _DivisionPageState();
}

class _DivisionPageState extends State<DivisionPage> {
  List division = [];

  Future<void> readData(String path) async {
    final String response = await rootBundle.loadString(path);
    final data = await json.decode(response);
    setState(() {
      division = data['division'];
    });
  }

  @override
  void initState() {
    readData('models/division.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Division Board')),
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
                  FlipCardPage(flashcards: division),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
