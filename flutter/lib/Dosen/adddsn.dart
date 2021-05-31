import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class AddDsn extends StatefulWidget {
  AddDsn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddDsnState createState() => _AddDsnState(title);
}

class _AddDsnState extends State<AddDsn> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  var url = "http://192.168.1.3/Peterpan/slim/public/dosen/";

  _AddDsnState(this.title);

  bool isLoading = false;

  TextEditingController conNidn = new TextEditingController();
  TextEditingController conNama = new TextEditingController();
  TextEditingController conEmail = new TextEditingController();
  TextEditingController conJk = new TextEditingController();
  TextEditingController conNohp = new TextEditingController();

  void addDsn() {

    http.post(url, body: {
      "nim": conNidn.text,
      "nama_dsn": conNama.text,
      "email": conEmail.text,
      "jenis_kelamin": conJk.text,
      "no_hp": conNohp.text
    });
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: conNidn,
                  decoration: InputDecoration(
                      labelText: "NIM",
                      hintText: "Contoh : 72180202",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conNama,
                  decoration: InputDecoration(
                      labelText: "NAMA LENGKAP",
                      hintText: "Contoh : Deden Prasetio",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conEmail,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Contoh : deden.prasetio@si.ukdw.ac.id",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  controller: conJk,
                  decoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                      hintText: "Contoh : L",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                MaterialButton(
                  minWidth: MediaQuery
                      .of(context)
                      .size
                      .width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.blue,
                  onPressed: () {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Simpan Data"),
                          content: Text(
                              "Apakah Anda akan menyimpan data ini?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  addDsn();
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
          ),
        )
    );
  }
}