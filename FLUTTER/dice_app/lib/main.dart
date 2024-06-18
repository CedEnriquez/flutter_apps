import 'package:dice_app/widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 8, 202, 160),
          Color.fromARGB(255, 35, 141, 118),
        ),
      ),
    );
  }
}
