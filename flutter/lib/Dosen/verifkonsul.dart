import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_silk/Dosen/detailkonsul.dart';
import 'package:flutter_silk/Mahasiswa/detailLihatDsn.dart';
import 'package:http/http.dart' as http;
class verifkonsul extends StatefulWidget {
  verifkonsul({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _verifkonsulState createState() => _verifkonsulState();
}

class _verifkonsulState extends State<verifkonsul> {

  Future<List> getData() async {
    final response= await http.get("http://192.168.1.7/peterpan/flutter/lib/crud/verif.php");
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("VERIFIKASI JADWAL"),),
        body: new FutureBuilder<List>(
            future: getData() ,
            builder: (context, snapshot){
              if(snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? new ItemList(list: snapshot.data,)
                  : new Center(child: new CircularProgressIndicator(),);
            }
        )

    );
  }
}

class ItemList extends StatelessWidget{

  List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          padding:const EdgeInsets.all(1.0),
          child:new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context)=> new detailkonsul(list:list, index: i,)
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text("TOPIK : ${list[i]['topik']}"),
                leading: new Icon(Icons.people_alt),
                subtitle: new Text("Nama Mahasiswa : ${list[i]['nama_mhs']}"),
              ),
            ),
          ),
        );
      },
    );
  }

}