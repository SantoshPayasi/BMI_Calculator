import 'package:flutter/material.dart';

import 'InputScreen.dart';

class PropertySetter extends StatelessWidget {
  const PropertySetter(
      {Key? key,
      required this.label,
      required this.value,
      required this.changeValue})
      : super(key: key);
  final label;
  final String value;
  final Function changeValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 20)),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  changeValue(label, "add");
                },
                child: Container(
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(70))),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  changeValue(label, "minus");
                },
                child: Container(
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(70))),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  //
  // void manipulateCall(label, String s) {
  //   final inputScreenState = InputScreen.inputScreenStateKey.currentState;
  //   if (inputScreenState != Null) {
  //     print("Well done");
  //     inputScreenState?.manipulateValue(label, s);
  //   }
  // }
}
