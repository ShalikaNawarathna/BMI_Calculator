import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainPage> {
  int height = 150;
  int weight = 70;
  String gender = '';
  late double bmi = calcualteBMI(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Male");
                      setState(() {
                        gender = 'M';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: gender == 'M' ? Colors.yellow.withAlpha(60):Colors.yellow.withAlpha(150),
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.boy, size: 150),
                          Text("Male"),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("Female");
                      setState(() {
                        gender = 'F';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: gender == 'F' ? Colors.yellow.withAlpha(60):Colors.yellow.withAlpha(150),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(Icons.girl, size: 150),
                          Text("Female"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$height',
                          style: kInputLabelColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) {
                                    height--;
                                    bmi = calcualteBMI(
                                        height: height, weight: weight);
                                  }
                                  print(height);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 50),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 200) {
                                    height++;
                                    bmi = calcualteBMI(
                                        height: height, weight: weight);
                                  }
                                  print(height);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 25,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '$weight',
                          style: kInputLabelColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 35) {
                                    weight--;
                                    bmi = calcualteBMI(
                                        height: height, weight: weight);
                                  }
                                  print(weight);
                                });
                              },
                              child: Icon(Icons.remove, size: 25),
                            ),
                            const SizedBox(width: 50),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight < 300) {
                                    weight++;
                                    bmi = calcualteBMI(
                                        height: height, weight: weight);
                                  }
                                  print(weight);
                                });
                              },
                              child: Icon(Icons.add, size: 25),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  const Text(
                    "BMI",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text('${bmi.toStringAsFixed(2)}',
                      style: kInputLabelColor.copyWith(
                          color: kOutpuTextColor, fontSize: 60)),
                  Text(
                    getResult(bmi),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calcualteBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Over weight";
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Under weight";
    }
  }
}
