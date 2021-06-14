import 'package:flutter/material.dart';
import 'package:flutter_silk/Dosen/dsndashboard.dart';
import 'package:flutter_silk/Mahasiswa/listpengajuan.dart';
import 'package:flutter_silk/Mahasiswa/mhsdashboard.dart';
import 'package:http/http.dart' as http;

class ubahdaftar extends StatefulWidget {
  final List list;
  final int index;

  ubahdaftar({this.list, this.index});
  @override
  _ubahdaftarState createState() => _ubahdaftarState();
}

class _ubahdaftarState extends State<ubahdaftar> {

  TextEditingController conNim;
  TextEditingController conNidn;
  TextEditingController conTopik;
  TextEditingController conHari;
  TextEditingController conTgl;
  TextEditingController conJam;
  TextEditingController conStat;

  void UbahData(){
    var url="http://192.168.1.7/peterpan/flutter/lib/crud/ubahkonsul.php";
    http.post(url,body: {
      "idKonsul": widget.list[widget.index]['idKonsul'],
      "nim": widget.list[widget.index]['nim'],
      "nidn": widget.list[widget.index]['nidn'],
      "topik": conTopik.text,
      "hari": conHari.text,
      "tgl": conTgl.text,
      "jam": conJam.text,
      "status_konsul": 'Disetujui'
    });
  }

  @override
  void initState(){
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
                          title: Text("Ubah Data"),
                          content: Text("Apakah Anda akan mengubah data ini?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  UbahData();
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context)=> new DashboardDsn()
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
                    "UBAH DATA",
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
