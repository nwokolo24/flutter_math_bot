import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../widgets/side_bar.dart';
import 'flashcard_page.dart';

class AdditionPage extends StatefulWidget {
  const AdditionPage({Key? key}) : super(key: key);

  @override
  State<AdditionPage> createState() => _AdditionPageState();
}

class _AdditionPageState extends State<AdditionPage> {
  List addition = [];

  Future<void> readData(String path) async {
    final String response = await rootBundle.loadString(path);
    final data = await json.decode(response);
    setState(() {
      addition = data['addition'];
    });
  }

  @override
  void initState() {
    readData('models/addition.json');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(title: const Text('Addition Board')),
      body: Container(
        color: Colors.orange.shade100,
        margin: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const Sidebar(),
            // const SizedBox(
            //   width: 10,
            // ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                  FlipCardPage(flashcards: addition),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


