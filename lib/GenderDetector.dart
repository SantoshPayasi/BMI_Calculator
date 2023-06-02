import 'package:flutter/material.dart';
class ReUsableWidget extends StatelessWidget {
  const ReUsableWidget({
    Key? key,
    required this.containerColor,
    this.Innerchild,
    this.setGender,
  }) : super(key: key);
  final Color containerColor;
  final Widget? Innerchild;
  final Function? setGender;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(setGender != null){
          setGender!();
        }

      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Innerchild,
      ),
    );
  }
}