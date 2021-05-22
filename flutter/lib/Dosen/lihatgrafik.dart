import 'package:flutter/material.dart';

class lihatgrafik extends StatefulWidget {
  lihatgrafik({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _lihatgrafikState createState() => _lihatgrafikState();
}

class _lihatgrafikState extends State<lihatgrafik> {
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