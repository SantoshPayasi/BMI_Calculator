import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'GenderDetector.dart';
import 'Result.dart';
import 'WeightandHeight.dart';


class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late Color maleContainer;
  late Color femaleContainer;
  int _age = 0;
  int _weight = 0;
  int _height = 0;
  late String gender = " ";

  @override
  void initState() {
    super.initState();
    maleContainer = const Color(0xFF050218);
    femaleContainer = Color(0xFF050218);
  }

  void manipulateValue(v1, String v2) {
    // if(kDebugMode){
    //   print(v1);
    //   print(v2);
    // }

    if (v1 == "Weight (Kg)") {
      if (v2 == "add") {
        setState(() {
          _weight += 1;
        });
      }
      if (v2 == "minus") {
        setState(() {
          if (_weight > 0) {
            _weight -= 1;
          }
        });
      }
    }
    if (v1 == "Age") {
      if (v2 == "add") {
        setState(() {
          _age += 1;
        });
      }
      if (v2 == "minus") {
        setState(() {
          if (_age > 0) {
            _age -= 1;
          }
        });
      }
    }
  }

  void changeProp(value) {
    if (value == 1) {
      setState(() {
        maleContainer = const Color(0xFF1c1f32);
        femaleContainer = const Color(0xFF050218);
      });
    }
    if (value == 2) {
      setState(() {
        maleContainer = const Color(0xFF050218);
        femaleContainer = const Color(0xFF1c1f32);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF080c23),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Expanded(
                      child: ReUsableWidget(
                          containerColor: maleContainer,
                          setGender: () {
                            setState(() {
                              gender = "Male";
                              changeProp(1);
                            });
                          },
                          Innerchild: const IconContent(
                              icon: Icons.male, label: Text("MALE")))),
                  Expanded(
                      child: ReUsableWidget(
                          containerColor: femaleContainer,
                          setGender: () {
                            setState(() {
                              gender = "Female";
                              changeProp(2);
                            });
                          },
                          Innerchild: const IconContent(
                              icon: Icons.female, label: Text("FEMALE"))))
                ],
              ),
            ),
            ReUsableWidget(
              containerColor: const Color(0xFF1c1f32),
              Innerchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Height",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "$_height",
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                  Slider(
                    value: _height.toDouble(),
                    min: 0.0,
                    max: 200.0,
                    onChanged: (value) {
                      setState(() {
                        _height = value.toInt();
                      });
                    },
                    activeColor: Colors.red.shade400,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: ReUsableWidget(
                  containerColor: Color(0xFF1c1f32),
                  Innerchild: PropertySetter(
                    label: "Weight (Kg)",
                    value: _weight.toString(),
                    changeValue: (label, String value) {
                      manipulateValue(label, value);
                    },
                  ),
                )),
                Expanded(
                    child: ReUsableWidget(
                        containerColor: Color(0xFF1c1f32),
                        Innerchild: PropertySetter(
                          label: "Age",
                          value: _age.toString(),
                          changeValue: (label, value) {
                            manipulateValue(label, value);
                          },
                        ))),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.red,
              ),
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () async {
                  // print(_weight);
                  // print(_height);
                  // print(_age);
                  // print(gender);
                  // print("Pressed");
                  if (gender != " " && _age >= 18 && _weight > 20 && _height > 10) {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                age: _age.toInt(),
                                weight: _weight.toDouble(),
                                gender: gender.toString(),
                                height: _height.toDouble())));
                    setState(() {
                      _age = 0;
                      _height = 0;
                      _weight = 0;
                      maleContainer = const Color(0xFF050218);
                      femaleContainer = const Color(0xFF050218);
                      gender = " ";
                    });
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text("Warning"),
                              content: const Text(
                                  "Please fill all details carefully, age is between 18 to 65 and \n weight is grater then 20"),
                              backgroundColor: Colors.white,
                              contentTextStyle:
                                  const TextStyle(color: Colors.red),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Close"))
                              ],
                            ));
                  }
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text("CALCULATE"),
              ),
            )
          ],
        ),
      );
  }
}

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.icon, required this.label})
      : super(key: key);
  final IconData icon;
  final Text label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        label
      ],
    );
  }
}
