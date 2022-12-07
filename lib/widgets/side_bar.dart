import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home,
      Icons.dashboard,
      Icons.timelapse,
      Icons.cloud,
      Icons.settings
    ];

    return Container(
      width: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          Image.asset('images/math_bot.jpeg'),
          const Spacer(
            flex: 1,
          ),
          ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return IconButton(
                onPressed: () {
                  if (index == 0) {
                    Get.toNamed('/home');
                  } else if (index == 1) {
                    Get.toNamed('/task_page');
                  }
                },
                color: const Color(0xFF3A86FF).withAlpha(155),
                iconSize: 35,
                icon: Icon(icons[index]),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 20,
              );
            },
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}