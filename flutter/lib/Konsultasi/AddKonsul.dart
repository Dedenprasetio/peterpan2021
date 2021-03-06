import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddKonsul extends StatefulWidget {
  AddKonsul({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddKonsulState createState() => _AddKonsulState(title);
}

class _AddKonsulState extends State<AddKonsul> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  var url = "http://192.168.1.7/peterpan/slim/public/konsul/";

  _AddKonsulState(this.title);

  bool isLoading = false;

  TextEditingController conNim = new TextEditingController();
  TextEditingController conNidn = new TextEditingController();
  TextEditingController conTopik = new TextEditingController();
  TextEditingController conHari = new TextEditingController();
  TextEditingController conTgl = new TextEditingController();
  TextEditingController conJam = new TextEditingController();
  TextEditingController conStat = new TextEditingController();

  void AddKonsul(){
    http.post(url, body: {
      "nim": conNim.text,
      "nidn": conNidn.text,
      "topik": conTopik.text,
      "hari": conHari.text,
      "tgl": conTgl.text,
      "jam": conJam.text,
      "status_konsul": 'Menunggu'
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child:ListView(
            children: [
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: conNim,
                  decoration: InputDecoration(
                      labelText: "NIM",
                      hintText: "Cth : 72180201",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conNidn,
                  decoration: InputDecoration(
                      labelText: "Pilih Dosen",
                      hintText: "--------",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conTopik,
                  decoration: InputDecoration(
                      labelText: "Masukkan Topik",
                      hintText: "Topik Anda",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
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
                TextFormField(
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
                TextFormField(
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
                          title: Text("Pengajuan Konsultasi"),
                          content: Text("Apakah Anda yakin ingin mengajukan data diatas?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  AddKonsul();
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
                    "AJUKAN KONSULTASI",
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