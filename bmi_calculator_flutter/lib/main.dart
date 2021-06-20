import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.pinkAccent,  //Color(0xFF0A0E21),
        scaffoldBackgroundColor: Colors.tealAccent, //Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
