import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_pe/models/patient.dart';
import 'package:lab_pe/models/track.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:math';
import 'add_track.dart';

class TableTrack extends StatelessWidget {
  Patient patient;
  TableTrack({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('patients')
        .doc(patient.id)
        .collection("tracking")
        .snapshots();

    return Scaffold(
        appBar: AppBar(
          title: Text('Seguimiento de Paciente'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.all(4),
                  elevation: 1,
                  child: Column(
                    children: [
                      ListTile(
                        subtitle: new RichText(
                          text: new TextSpan(
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: "Fecha : ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                new TextSpan(text: data["date"]),
                                new TextSpan(text: "\n"),
                                new TextSpan(
                                    text: "Peso : ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                new TextSpan(text: data["weigth"].toString()),
                                new TextSpan(text: "\n"),
                                new TextSpan(
                                    text: "Presion : ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                new TextSpan(text: data["presion"].toString()),
                                new TextSpan(text: "\n"),
                                new TextSpan(
                                    text: "Saturacion : ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                new TextSpan(
                                    text: data["saturation"].toString()),
                                new TextSpan(text: "\n"),
                                new TextSpan(
                                    text: "Temperatura : ",
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                new TextSpan(
                                    text: data["temperature"].toString()),
                              ]),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new AddTrack(patient: patient)),
            );
          },
          child: Icon(Icons.add),
        ));
  }
}

class _DataSource extends DataTableSource {
  List<Track> _rows;

  _DataSource(this.context, this._rows);

  final BuildContext context;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: false,
      cells: [
        DataCell(Text(row.date)),
        DataCell(Text(row.weight.toString())),
        DataCell(Text(row.temperature.toString())),
        DataCell(Text(row.pressure.toString())),
        DataCell(Text(row.saturation.toString()))
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

//LUCHOOOOO
class MyData extends DataTableSource {
  Patient patient;
  final BuildContext context;
  MyData(this.context, this.patient);

  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(10000)
          });

  bool get isRowCountApproximate => false;
  int get rowCount => _data.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
    ]);
  }
}
