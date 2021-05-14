import 'package:flutter/material.dart';



class dsndashboard extends StatefulWidget {  //<~~~
  dsndashboard({Key key, this.title}) : super(key: key);  //<~~~~

  final String title;

  @override
  _dsndashboardState createState() => _dsndashboardState();  //<~~~~
}

class _dsndashboardState extends State<dsndashboard> {    //<~~


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
              title: Text("Lihat Datar Konsultasi"),    //<~~~~
              trailing: Icon(Icons.list_alt),   //<~~~
              subtitle: Text("Daftar Konsultasi"),  //<~~
              onTap: () {

              },
            ),
            ListTile(
              title: Text("Lihat Grafik Pertemua"),   //<~~~
              trailing: Icon(Icons.graphic_eq_outlined),   //<~~
              subtitle: Text("Grafik Pertemuan"),   //<~~~


            ),
            ListTile(
              title: Text("Verifikasi Konsultasi"),   //<~~~
              trailing: Icon(Icons.verified),   //<~~
              subtitle: Text("Verifikasi"),   //<~~~


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
            child: Text("DOSEN",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          )
      ),
    );
  }
}