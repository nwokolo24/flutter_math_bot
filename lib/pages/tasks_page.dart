import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_math_bot/main.dart';

import '../widgets/side_bar.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Select Any of the Boards Below to Start Learning!"),
      ),
      backgroundColor: Colors.blue.shade200,
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const Sidebar(),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const _TasksCard(
                        title: 'Get started with Addition',
                        imageUrl:
                            'https://thumbs.dreamstime.com/b/math-addition-simple-mathematic-wooden-frame-cork-board-33484523.jpg',
                        pageRoute: '/addition',
                      ),
                      const _TasksCard(
                        title: 'Get started with Subtraction',
                        imageUrl:
                            'https://thumbs.dreamstime.com/b/simple-subtraction-formula-colorful-plastic-numbers-61978933.jpg',
                        pageRoute: '/subtraction',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const _TasksCard(
                        title: 'Get started with Multiplication',
                        imageUrl:
                            'https://thumbs.dreamstime.com/b/math-multiplication-simple-mathematic-wooden-frame-cork-board-33484473.jpg',
                        pageRoute: '/multiplication',
                      ),
                      const _TasksCard(
                        title: 'Get started with Division',
                        imageUrl:
                            'https://thumbs.dreamstime.com/b/simple-division-formula-math-old-paper-background-62589638.jpg',
                        pageRoute: '/division',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TasksCard extends StatelessWidget {
  const _TasksCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.pageRoute,
  });

  final String title;
  final String imageUrl;
  final String pageRoute;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(pageRoute);
      },
      child: Card(
        elevation: 20,
        // color: Colors.grey,
        shadowColor: Colors.blue.shade400,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.35,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
