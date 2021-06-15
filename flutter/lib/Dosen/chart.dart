import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;

class charts extends StatefulWidget {
  @override
  _chartsState createState() => _chartsState();
}

class _chartsState extends State<charts> {
  @override
  Widget build(BuildContext context) {

    var data=[
      grafik("Senin", 2),
      grafik("Selasa", 1),
      grafik("Rabu", 4),
      grafik("Kamis", 1),
      grafik("Jumat", 3),
    ];

    var series =[
      chart.Series(
        domainFn: (grafik grafik,_)=>grafik.hari,
        measureFn: (grafik grafik,_)=>grafik.jumlah,
        id: 'grafik',
        data: data,
        labelAccessorFn: (grafik grafik,_)=> '${grafik.hari} : ${grafik.jumlah.toString()}'
      )
    ];

    var char = chart.BarChart(
      series,
      vertical: false,
      barRendererDecorator: chart.BarLabelDecorator<String>(),
      domainAxis: chart.OrdinalAxisSpec(renderSpec: chart.NoneRenderSpec()),
    );

    return Scaffold(
      appBar: AppBar(title: Text("GRAFIK PERTEMUAN"),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text("Grafik Pertemuan", style: TextStyle(fontSize: 30),),
            SizedBox(height: 400, child: char,)
          ],

      ),
      )

    );
  }
}

class grafik{
  final String hari;
  final int jumlah;

  grafik(this.hari, this.jumlah);
}
