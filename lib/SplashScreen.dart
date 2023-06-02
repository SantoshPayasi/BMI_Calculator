import 'package:flutter/material.dart';

import 'MainScreen.dart';
void main(){
  runApp(SplashScreen());
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _ReplachScreen();
  }
  Future <void> _ReplachScreen() async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        body:Center(
          child: Container(
            height:100,
            width:100,
            alignment: Alignment.center,
            child: const Image(image: AssetImage('assets/images/BMI_CALC.png'),),
          ),
        ) ,
      ),
    );
  }
}

