import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_silk/main.dart';

class splashscreen extends StatefulWidget {

  _splashscreen createState() => _splashscreen();
}

class _splashscreen extends State<splashscreen> {

  void initState(){
    super.initState();
    splashStart();
  }

  splashStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration,(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Image.asset(
            "image/sianji.png",
            width: 200.0,
            height: 400.0,
          )
      ),
    );
  }
}