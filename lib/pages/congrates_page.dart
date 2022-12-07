import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/music_player.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade200,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.blueGrey,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          margin: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(children: [
              const SizedBox(height: 20,),
              Text('Congratulations',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ElevatedButton(
                        child: const Text(
                          'Go back to TaskPage',
                        ),
                        onPressed: () {
                          Get.toNamed('/task_page');
                        },
                      ),
                    ),
                    SizedBox(height: 30,),
                    Center(
                      child: ElevatedButton(
                        child: const Text(
                          'Go to HomePage',
                        ),
                        onPressed: () {
                          Get.toNamed('/home');
                        },
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
