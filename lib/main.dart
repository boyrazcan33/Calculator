import 'package:flutter/material.dart';
import 'views/calculator_screen.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}