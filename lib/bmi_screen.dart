import 'dart:math';

import 'package:bmi_calculator/bmi_result_screeen.dart';
import 'package:flutter/material.dart';

class BmiCalc extends StatefulWidget {
  const BmiCalc({super.key});

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  bool isMale = true;
  double height = 120;
  int weight = 40;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b0f1f),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b0f1f),
        title: const Center(
            child: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale
                              ? Colors.blueGrey
                              : const Color(
                                  0xff111324,
                                ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.male, color: Colors.white, size: 70),
                                SizedBox(height: 15),
                                Text("MALE",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey)),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isMale
                              ? Colors.blueGrey
                              : const Color(
                                  0xff111324,
                                ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.female,
                                    color: Colors.white, size: 70),
                                SizedBox(height: 10),
                                Text("FEMALE",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey)),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff1b1a2e),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${height.round()}",
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Slider(
                        activeColor: const Color(0xff0b0f1f),
                        value: height,
                        max: 220,
                        min: 80,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        })
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff1b1a2e),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text(
                            "$age",
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "age--",
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                heroTag: "age++",
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff1b1a2e),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text(
                            "$weight",
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  heroTag: "weight--",
                                  mini: true,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child: const Icon(Icons.remove)),
                              FloatingActionButton(
                                  heroTag: "weight++",
                                  mini: true,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: const Icon(Icons.add)),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: FloatingActionButton(
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BmiResultScreen(
                              result: result,
                              age: age,
                              isMale: isMale,
                            )),
                  );
                },
                child: const Text("Calculate"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
