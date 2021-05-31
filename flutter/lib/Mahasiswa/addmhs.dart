import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class addmhs extends StatefulWidget {
  addmhs({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _addmhsState createState() => _addmhsState(title);
}

class _addmhsState extends State<addmhs> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  var url = "http://192.168.1.3/Peterpan/slim/public/mahasiswa/";

  _addmhsState(this.title);

  bool isLoading = false;

  TextEditingController conNim = new TextEditingController();
  TextEditingController conNama = new TextEditingController();
  TextEditingController conEmail = new TextEditingController();
  TextEditingController conJk = new TextEditingController();
  TextEditingController conNohp = new TextEditingController();

  void addMhs() {

    http.post(url, body: {
      "nim": conNim.text,
      "nama_mhs": conNama.text,
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
                  controller: conNim,
                  decoration: InputDecoration(
                      labelText: "NIM",
                      hintText: "Contoh : 72180201",
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
                                  addMhs();
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