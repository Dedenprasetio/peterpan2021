import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddKonsulDsn extends StatefulWidget {
  AddKonsulDsn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddKonsulDsnState createState() => _AddKonsulDsnState(title);
}

class _AddKonsulDsnState extends State<AddKonsulDsn> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  var url = "http://192.168.1.7/Peterpan/slim/public/konsul/";

  _AddKonsulDsnState(this.title);

  bool isLoading = false;

  TextEditingController conNidn = new TextEditingController();
  TextEditingController conTopik = new TextEditingController();
  TextEditingController conHari = new TextEditingController();
  TextEditingController conTgl = new TextEditingController();
  TextEditingController conJam = new TextEditingController();

  void AddKonsulDsn(){
    http.post(url, body: {
      "nim": '0',
      "nidn": conNidn.text,
      "topik": conTopik.text,
      "hari": conHari.text,
      "tgl": conTgl.text,
      "jam": conJam.text,
      "status_konsul": 'Disetujui'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child:ListView(
            children:[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: conNidn,
                  decoration: InputDecoration(
                      labelText: "Masukkan NIDN",
                      hintText: "--------",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextField(
                  controller: conTopik,
                  decoration: InputDecoration(
                      labelText: "Masukkan Topik",
                      hintText: " ",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextField(
                  controller: conHari,
                  decoration: InputDecoration(
                      labelText: "Hari",
                      hintText: "Cth : Senin",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextField(
                  controller: conTgl,
                  decoration: InputDecoration(
                      labelText: "Tanggal",
                      hintText: "Cth : yyyy-mm-dd",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextField(
                  controller: conJam,
                  decoration: InputDecoration(
                      labelText: "Tentukan Jam",
                      hintText: "Cth : 10:00 WIB - 11:00 WIB",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
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
                          title: Text("Simpan Data"),
                          content: Text("Apakah Anda akan menyimpan data ini?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  AddKonsulDsn();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
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
                    "Simpan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            ]
          ),
        )
    );
  }
}