import 'package:flutter/material.dart';
import 'package:flutter_silk/Mahasiswa/listpengajuan.dart';
import 'package:flutter_silk/Mahasiswa/mhsdashboard.dart';
import 'package:http/http.dart' as http;

class joinkonsul extends StatefulWidget {
  final List list;
  final int index;

  joinkonsul({this.list, this.index});

  @override
  _joinkonsulState createState() => _joinkonsulState();
}

class _joinkonsulState extends State<joinkonsul> {

  TextEditingController conNim;
  TextEditingController conNidn;
  TextEditingController conTopik;
  TextEditingController conHari;
  TextEditingController conTgl;
  TextEditingController conJam;
  TextEditingController conStat;

  void addjoinkonsul(){
    var url = "http://192.168.1.7/peterpan/slim/public/konsul/";
    http.post(url, body: {
      "nim": conNim.text,
      "nidn": widget.list[widget.index]['nidn'],
      "topik": widget.list[widget.index]['topik'],
      "hari": widget.list[widget.index]['hari'],
      "tgl": widget.list[widget.index]['tgl'],
      "jam": widget.list[widget.index]['jam'],
      "status_konsul": 'Menunggu'
    });
  }

  void konfirmjoin(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Apakah anda yakin ingin mengikuti Konsultasi ini?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("YA", style: new TextStyle(color: Colors.black),),
          color: Colors.greenAccent,
          onPressed: (){
            addjoinkonsul();
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context)=> new DashboardMhs(),
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
  void initState(){
    conNim= new TextEditingController(text: ' ');
    conNidn= new TextEditingController(text: widget.list[widget.index]['nidn']);
    conTopik= new TextEditingController(text: widget.list[widget.index]['topik']);
    conHari= new TextEditingController(text: widget.list[widget.index]['hari']);
    conTgl= new TextEditingController(text: widget.list[widget.index]['tgl']);
    conJam= new TextEditingController(text: widget.list[widget.index]['jam']);
    conStat= new TextEditingController(text: widget.list[widget.index]['status_konsul']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("UBAH JADWAL"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                TextFormField(
                  controller: conNim,
                  decoration: InputDecoration(
                      labelText: "NIM",
                      hintText: "--------",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.blue,
                  onPressed: () {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Ikuti Konsul"),
                          content: Text("Apakah Anda ingin mengikuti Konsultasi ini?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  addjoinkonsul();
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context)=> new DashboardMhs()
                                      )
                                  );
                                },
                                child: Text("Ya")
                            ),
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Tidak")
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "IKUTI KONSUL",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
