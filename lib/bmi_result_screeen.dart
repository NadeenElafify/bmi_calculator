import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;

  const BmiResultScreen(
      {super.key,
      required this.result,
      required this.isMale,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b0f1f),
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xff0b0f1f),
        title: const Center(
            child: Text(
          'BMI Result',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Gender : ${isMale ? "Male" : "Female"}",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            "Age : $age",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            "Result : ${result.round()}",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ]),
      ),
    );
  }
}
