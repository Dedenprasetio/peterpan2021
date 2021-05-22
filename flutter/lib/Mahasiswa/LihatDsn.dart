import 'package:flutter/material.dart';

class LihatDsn extends StatefulWidget {
  LihatDsn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LihatDsnState createState() => _LihatDsnState();
}

class _LihatDsnState extends State<LihatDsn> {
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