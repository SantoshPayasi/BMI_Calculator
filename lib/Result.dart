import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'InputScreen.dart';

// void main() {
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
// }

class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
    required this.age,
    required this.weight,
    required this.gender,
    required this.height,
  }) : super(key: key);
  final double weight;
  final double height;
  final String gender;
  final int age;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late double BMI;
  late String Status;

  @override
  void initState() {
    super.initState();
    BMI = (widget.weight)/((widget.height) * (widget.height))*10000;
        print(BMI);
    if (BMI < 18.5) {
      setState(() {
        Status = "UnderWeight";
      });
    } else if (BMI >= 18.5 && BMI <= 24.9) {
      setState(() {
        Status = "Normal";
      });
    } else if (BMI >= 25.0 && BMI <= 29.9) {
      setState(() {
        Status = "OverWeight";
      });
    } else {
      setState(() {
        Status = "Obesity";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.weight);
    // print(widget.height);
    // print(widget.age);
    return Scaffold(
      backgroundColor: const Color(0xFF080c23),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 40),
              child: const Text(
                "Your Result",
                style: TextStyle(fontSize: 50),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: const BoxDecoration(
                color: Color(0xFF1c1f32),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Status,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold),
                ),
                 Text(
                  "${BMI.toInt()}",
                  style: const TextStyle(fontSize: 60),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      "You have a $Status body weight\n                 Good Job",
                      style: const TextStyle(
                          color: Colors.grey, letterSpacing: 1, fontSize: 18),
                    ))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InputScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: const Text(
                "RE-CALCULATE",
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
