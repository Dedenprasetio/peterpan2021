import 'package:flutter/material.dart';

class verifkonsul extends StatefulWidget {
  verifkonsul({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _verifkonsulState createState() => _verifkonsulState();
}

class _verifkonsulState extends State<verifkonsul> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(widget.title),
        ),
        body: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

              ],
            ),
          ),
        )
    );
  }
}