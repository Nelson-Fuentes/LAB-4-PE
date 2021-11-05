import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_pe/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTrack extends StatelessWidget {
  Patient patient;
  String fecha = "";
  num peso = 0.0, tempe = 0.0, sat = 0.0, pre = 0.0;

  AddTrack({Key? key, required this.patient}) : super(key: key);

  getfecha(fecha_) {
    this.fecha = fecha_;
  }

  getpeso(peso_) {
    this.peso = double.parse(peso_);
  }

  gettempe(tempe_) {
    this.tempe = double.parse(tempe_);
  }

  getsat(sat_) {
    this.sat = double.parse(sat_);
  }

  getpre(pre_) {
    this.pre = double.parse(pre_);
  }

  saveTrack() async {
    Map<String, dynamic> pat = {
      "date": this.fecha,
      "weigth": this.peso,
      "temperature": this.tempe,
      "saturation": this.sat,
      "presion": this.pre
    };

    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection("patients")
        .doc(patient.id)
        .collection("tracking");
    collectionReference.add(pat).whenComplete(() {
      print("registrado");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Añadir Seguimiento"),
        ),
        body: new Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // initialValue: '',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Fecha',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.event,
                ),
              ),
              onChanged: (String fecha) {
                getfecha(fecha);
              },
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
              onChanged: (String peso) {
                getpeso(peso);
              },
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
              onChanged: (String temp) {
                gettempe(temp);
              },
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
              onChanged: (String sat) {
                getsat(sat);
              },
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
              onChanged: (String pre) {
                getpre(pre);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,
                    30), // double.infinity is the width and 30 is the height
              ),
              onPressed: () {
                saveTrack();
                Navigator.pop(context);
              },
              icon: Icon(Icons.save, size: 18),
              label: Text("GUARDAR"),
            ),
          )
        ]));
  }
}
