import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    routes: {
      'route1': (BuildContext context) =>Tania(),
    },
  ));
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DATA MAHASISWA'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.calculate),
              tooltip: 'Aritmatika dan IF',
              onPressed: () {
                Navigator.of(context).pushNamed("route1");
              }),
        ],
      ),
      body: 
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text("NAMA MAHASISWA")),
            DataColumn(label: Text("NIRM")),
            DataColumn(label: Text("KELAS")),
            DataColumn(label: Text("TUGAS"))
          
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Tania Anggitia Audina")),
                DataCell(Text("2018020454")),
                DataCell(Text("6 SIA 4")),
                DataCell(Text("UAS")),
           
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Tania extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diskon dengan Aritmatika dan Fungsi IF'),
      ),
      body: TaniaApp(),
    );
  }
}

class TaniaApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TaniaApp> {
  final txtnama = TextEditingController();
  final txtjumlah = TextEditingController();
  final txtharga = TextEditingController();

  String nama = '';
  String total = '';
  String bayar = '';

  onHitung() {
    setState(() {
      nama = (txtnama.text);
      var jumlah = int.parse(txtjumlah.text);
      total = " $jumlah Jam";
      var harga = jumlah * int.parse(txtharga.text);
      if (jumlah > 3) {
        nama = (txtnama.text);
        var diskon = harga - 500;
        bayar = "Rp. $diskon";
      } else {
        bayar = "Rp. $harga";
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          TextField(
            controller: txtnama,
            decoration: new InputDecoration(
              labelText: "Kode PC",
            ),
          ),
          TextField(
            controller: txtjumlah,
            decoration: new InputDecoration(
              labelText: "Total Jam",
            ),
          ),
          TextField(
            controller: txtharga,
            decoration: new InputDecoration(
              labelText: "Harga per Jam",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              width: 200,
              height: 40,
              margin: EdgeInsets.only(top: 32),
              decoration: BoxDecoration(
                  color: Color(0XFFDD50000),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: FlatButton(
                onPressed: onHitung,
                child: Text('Proses'),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(label: Text("KODE PC")),
                DataColumn(label: Text("JUMLAH JAM")),
                DataColumn(label: Text("TOTAL BAYAR")),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(nama)),
                    DataCell(Text(total)),
                    DataCell(Text(bayar)),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
