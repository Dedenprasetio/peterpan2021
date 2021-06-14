import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_silk/Konsultasi/joinkonsul.dart';
import 'package:flutter_silk/main.dart';
import 'package:http/http.dart' as http;

class detailLihatDsn extends StatefulWidget{
  List list;
  int index;
  detailLihatDsn({this.index,this.list});

  @override
  _detailLihatDsnState createState() => _detailLihatDsnState();
}

class _detailLihatDsnState extends State<detailLihatDsn> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nama_dsn']}")),
      body: new Container(
        height: 200.0,
        padding: const EdgeInsets.all(10.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children:<Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text("Hari : ${widget.list[widget.index]['hari']}", style: new TextStyle(fontSize: 15.0),),
                new Text("Tanggal : ${widget.list[widget.index]['tgl']}", style: new TextStyle(fontSize: 15.0),),
                new Text("Jam : ${widget.list[widget.index]['jam']}", style: new TextStyle(fontSize: 15.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child:  new Text("IKUTI KONSUL"),
                      color: Colors.greenAccent,
                      onPressed: ()=>Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context)=> new joinkonsul(list: widget.list, index: widget.index,),
                          )
                      ),
                    )
                  ],
                )
              ],
            )
          ),
        ),
      ),

    );
  }
}
