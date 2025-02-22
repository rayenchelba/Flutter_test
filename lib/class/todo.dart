import 'package:flutter/material.dart';

enum Priorities {
  urgent(color: Colors.red, title: 'urgent'),
  high(color: Colors.orange, title: 'high'),
  medium(color: Colors.amber, title: 'medium'),
  low(color: Colors.green, title: 'low');

  final Color color;
  final String title;

  const Priorities({required this.color, required this.title});
}

class todo {
  String title;
  String description;
  Priorities priorities;
  todo({required this.title, required this.description, required this.priorities});
}