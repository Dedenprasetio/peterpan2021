import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_silk/Dosen/dsndashboard.dart';
import 'package:flutter_silk/Konsultasi/joinkonsul.dart';
import 'package:flutter_silk/Konsultasi/ubahkonsul.dart';
import 'package:flutter_silk/Mahasiswa/listpengajuan.dart';
import 'package:flutter_silk/Mahasiswa/mhsdashboard.dart';
import 'package:flutter_silk/main.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class detailkonsul extends StatefulWidget{
  List list;
  int index;
  detailkonsul({this.index,this.list});

  @override
  _detailkonsulState createState() => _detailkonsulState();
}

class _detailkonsulState extends State<detailkonsul> {

  void SetujuData(){
    var url="http://192.168.1.7/peterpan/flutter/lib/crud/ubahkonsul.php";
    http.post(url,body: {
      "idKonsul": widget.list[widget.index]['idKonsul'],
      "nim": widget.list[widget.index]['nim'],
      "nidn": widget.list[widget.index]['nidn'],
      "topik": widget.list[widget.index]['topik'],
      "hari": widget.list[widget.index]['hari'],
      "tgl": widget.list[widget.index]['tgl'],
      "jam": widget.list[widget.index]['jam'],
      "status_konsul": 'Disetujui'
    });
  }

  void TolakData(){
    var url="http://192.168.1.7/peterpan/flutter/lib/crud/ubahkonsul.php";
    http.post(url,body: {
      "idKonsul": widget.list[widget.index]['idKonsul'],
      "nim": widget.list[widget.index]['nim'],
      "nidn": widget.list[widget.index]['nidn'],
      "topik": widget.list[widget.index]['topik'],
      "hari": widget.list[widget.index]['hari'],
      "tgl": widget.list[widget.index]['tgl'],
      "jam": widget.list[widget.index]['jam'],
      "status_konsul": 'Ditolak'
    });
  }

  void konfirmSetuju(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Apakah anda yakin menyetujui Topik '${widget.list[widget.index]['topik']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("YA", style: new TextStyle(color: Colors.black),),
          color: Colors.greenAccent,
          onPressed: (){
            SetujuData();
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context)=> new DashboardDsn(),
                )
            );
          },
        ),
        new RaisedButton(
          child: new Text("BATAL", style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  void konfirmTolak(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Apakah anda yakin Menolak Topik '${widget.list[widget.index]['topik']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("YA", style: new TextStyle(color: Colors.black),),
          color: Colors.greenAccent,
          onPressed: (){
           TolakData();
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context)=> new DashboardDsn(),
                )
            );
          },
        ),
        new RaisedButton(
          child: new Text("BATAL", style: new TextStyle(color: Colors.black),),
          color: Colors.red,
          onPressed: ()=> Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['nama_dsn']}")),
      body: new Container(
        height: 300.0,
        padding: const EdgeInsets.all(10.0),
        child: new Card(
          child: new Center(
              child: new Column(
                children:<Widget>[
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  new Text("Topik : ${widget.list[widget.index]['topik']}", style: new TextStyle(fontSize: 15.0),),
                  new Text("NIM : ${widget.list[widget.index]['nim']}", style: new TextStyle(fontSize: 15.0),),
                  new Text("Nama Mahasiswa : ${widget.list[widget.index]['nama_mhs']}", style: new TextStyle(fontSize: 15.0),),
                  new Text("Hari : ${widget.list[widget.index]['hari']}", style: new TextStyle(fontSize: 15.0),),
                  new Text("Tanggal : ${widget.list[widget.index]['tgl']}", style: new TextStyle(fontSize: 15.0),),
                  new Text("Jam : ${widget.list[widget.index]['jam']}", style: new TextStyle(fontSize: 15.0),),
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),

                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new RaisedButton(
                          child:  new Text("SETUJUI"),
                          color: Colors.greenAccent,
                          onPressed: ()=>konfirmSetuju()
                      ),
                      new RaisedButton(
                          child:  new Text("TOLAK"),
                          color: Colors.red,
                          onPressed: ()=>konfirmTolak()
                      ),
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
