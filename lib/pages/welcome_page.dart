import 'package:flutter/material.dart';

import '../widgets/background_filter.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/backgroundpicture',
          fit: BoxFit.cover,),
        const BackgroundFilter(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ElevatedButton(
                  child: const Text('Get Started'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}