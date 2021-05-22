import 'package:flutter/material.dart';
import 'package:flutter_silk/Konsultasi/AddKonsul.dart';
import 'file:///D:/ProgWeb/xaamp/htdocs/Peterpan/flutter/lib/Mahasiswa/LihatDsn.dart';



class mhsdashboard extends StatefulWidget {  //<~~~
  mhsdashboard({Key key, this.title}) : super(key: key);  //<~~~~

  final String title;

  @override
  _mhsdashboardState createState() => _mhsdashboardState();  //<~~~~
}

class _mhsdashboardState extends State<mhsdashboard> {    //<~~


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              accountName: Text("Account"), //<~~~~~
              accountEmail: Text("Account@si.ukdw.ac.id"), //<~~~~
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black38,
                child: Text(
                  "DP", //<~ ~~~~~
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Lihat List Dosen"),    //<~~~~
              trailing: Icon(Icons.people_alt),   //<~~~
              subtitle: Text("List Dosen"),  //<~~
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LihatDsn(title: "LIHAT DOSEN")),  //<~~
                );

              },
            ),
            ListTile(
              title: Text("Pengajuan Jadwal Konsultasi"),   //<~~~
              trailing: Icon(Icons.schedule_outlined),   //<~~
              subtitle: Text("Jadwal Konsultasi"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddKonsul(title: "PENGAJUAN KONSULTASI")),  //<~~
                );

              },//<~~~
            ),
            Divider(
              color: Colors.black,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
      body: Container(
          child: Center(
            child: Text("MAHASISWA",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          )
      ),
    );
  }
}