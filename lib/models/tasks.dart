import 'package:flutter/material.dart';


class Task {
  final String id;
  final String title;
  final String description;
  final ImageProvider? image;

  const Task(
      {required this.id,
        required this.title,
        required this.description,
        required this.image});

  static List<Task> tasklists = [
    Task(
        id: '1',
        title: 'Addition',
        description: 'Learn Addition',
        image: const NetworkImage(
            'https://thumbs.dreamstime.com/b/math-addition-simple-mathematic-wooden-frame-cork-board-33484523.jpg')),
    Task(
        id: '2',
        title: 'Subtraction',
        description: 'Learn Subtraction',
        image: const NetworkImage(
            'https://thumbs.dreamstime.com/b/simple-subtraction-formula-colorful-plastic-numbers-61978933.jpg')),
    Task(
        id: '3',
        title: 'Multiplication',
        description: 'Learn Multiplication',
        image: const NetworkImage(
            'https://thumbs.dreamstime.com/b/math-multiplication-simple-mathematic-wooden-frame-cork-board-33484473.jpg')),
    Task(
        id: '4',
        title: 'Division',
        description: 'Learn Division',
        image: const NetworkImage(
            'https://thumbs.dreamstime.com/b/simple-division-formula-math-old-paper-background-62589638.jpg')),
  ];
}
