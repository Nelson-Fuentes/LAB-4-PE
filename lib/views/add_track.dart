import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_pe/models/patient.dart';

class AddTrack extends StatelessWidget {
  Patient patient;

  AddTrack({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Añadir Seguimiento"),
        ),
        body:new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // initialValue: '',
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Fecha',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.event,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // initialValue: '',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Peso',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.monitor_weight_outlined,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // initialValue: '',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Temperatura',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.thermostat_outlined,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // initialValue: '',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Saturación',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.health_and_safety_outlined,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // initialValue: '',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Presión',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.favorite_outlined,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 30), // double.infinity is the width and 30 is the height
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.save, size: 18),
                  label: Text("GUARDAR"),
                ),
              )
            ]
        )
    );
  }
}
