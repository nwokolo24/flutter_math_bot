import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_math_bot/pages/addition.dart';
import 'package:simple_math_bot/pages/congrates_page.dart';
import 'package:simple_math_bot/pages/division.dart';
import 'package:simple_math_bot/pages/multiplication.dart';
import 'package:simple_math_bot/pages/subtraction.dart';


import 'pages/home_page.dart';
import 'pages/tasks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Math Bot',
      home: const HomePage(),
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/task_page', page: () => const TasksPage()),
        GetPage(name: '/addition', page: () => const AdditionPage()),
        GetPage(name: '/subtraction', page: () => const SubtractionPage()),
        GetPage(
            name: '/multiplication', page: () => const MultiplicationPage()),
        GetPage(name: '/division', page: () => const DivisionPage()),
        GetPage(name: '/congratspage', page: () => const CongratsPage()),
      ],
    );
  }
}