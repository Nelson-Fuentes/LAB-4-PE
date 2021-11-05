import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_pe/models/patient.dart';
import 'package:lab_pe/models/track.dart';
import 'package:lab_pe/views/table_track.dart';
import 'package:lab_pe/views/map_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewPatient extends StatelessWidget {
  var patient;
  String nombre = "", apellidos = "", direccion = "", fecha = "";
  num estatura = 0.0, latitud = 0.0, longitud = 0.0;

  getnombre(nombre_) {
    this.nombre = nombre_;
  }

  getapellidos(apellidos_) {
    this.apellidos = apellidos_;
  }

  getfecha(fecha_) {
    this.fecha = fecha_;
  }

  getdireccion(direccion_) {
    this.direccion = direccion_;
  }

  getestatura(estatura_) {
    this.estatura = double.parse(estatura_);
  }

  getlatitud(latitud_) {
    this.latitud = double.parse(latitud_);
  }

  getlongitud(longitud_) {
    this.longitud = double.parse(longitud_);
  }

  savePat() async {
    Map<String, dynamic> pat = {
      "address": this.direccion,
      "date_birth": this.fecha,
      "first_name": this.nombre,
      "last_name": this.apellidos,
      "latitude": this.latitud,
      "longitude": this.longitud,
      "stature": this.estatura
    };

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("patients").doc(this.patient.id);
    documentReference.set(pat).whenComplete(() {
      print("actualizado");
    });
  }

  ViewPatient({Key? key, this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.nombre = this.patient.firstName;
    this.apellidos = this.patient.lastName;
    this.fecha = this.patient.dateBirth;
    this.estatura = this.patient.stature;
    this.direccion = this.patient.address;
    this.latitud = this.patient.latitude;
    this.longitud = this.patient.longitude;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Ver Paciente"),
        ),
        body: new Column(children: <Widget>[
          Text(""),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: this.patient.firstName,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.account_circle,
                ),
              ),
              onChanged: (String nombre) {
                getnombre(nombre);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: this.patient.lastName,
              decoration: InputDecoration(
                labelText: 'Apellidos',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.person_outline,
                ),
              ),
              onChanged: (String apellidos) {
                getapellidos(apellidos);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: this.patient.dateBirth,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Fecha de Nacimiento',
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
              initialValue: this.patient.stature.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Estatura',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.height,
                ),
              ),
              onChanged: (String estatura) {
                getestatura(estatura);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: this.patient.address,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                labelText: 'Dirección',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.home,
                ),
              ),
              onChanged: (String direccion) {
                getdireccion(direccion);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: this.patient.latitude.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'latitud',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.home,
                ),
              ),
              onChanged: (String latitud) {
                getlatitud(latitud);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: this.patient.longitude.toString(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'longitude',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.home,
                ),
              ),
              onChanged: (String latitud) {
                getlatitud(latitud);
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
                savePat();
                Navigator.pop(context);
              },
              icon: Icon(Icons.save, size: 18),
              label: Text("GUARDAR"),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new MapPage(
                            lattitude: this.patient.latitude,
                            longitude: this.patient.longitude,
                            name: this.patient.firstName,
                            lastname: this.patient.lastName,
                          )),
                );
              },
              icon: Icon(Icons.map, size: 18),
              label: Text("VER MAPA"),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new TableTrack(patient: patient)),
                );
              },
              icon: Icon(Icons.trending_up_outlined, size: 18),
              label: Text("VER SEGUIMIENTO"),
            ),
          ),
        ]));
  }
}
