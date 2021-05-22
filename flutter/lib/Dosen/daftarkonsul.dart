import 'package:flutter/material.dart';

class daftarkonsul extends StatefulWidget {
  daftarkonsul({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _daftarkonsulState createState() => _daftarkonsulState();
}

class _daftarkonsulState extends State<daftarkonsul> {
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