import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_pe/models/patient.dart';
import 'package:lab_pe/models/track.dart';

import 'add_track.dart';

class TableTrack extends StatelessWidget {
  Patient patient;
  TableTrack({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seguimiento de Paciente'),
      ),
      body:ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PaginatedDataTable(
            // header: Text('Header Text'),
            rowsPerPage: 10,
            columns: [
              DataColumn(label: Text('Fecha')),
              DataColumn(label: Text('Peso')),
              DataColumn(label: Text('Temperatura')),
              DataColumn(label: Text('Presión')),
              DataColumn(label: Text('Saturación')),
            ],
            source: _DataSource(context, this.patient.tracks),
          ),

        ],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => new AddTrack(patient: patient)),
            );
          },
          child: Icon(Icons.add),
        )
    );
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
