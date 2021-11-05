import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPatient extends StatelessWidget {
  //const AddPatient({Key? key}) : super(key: key);
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

  createPatients() async {
    Map<String, dynamic> pat = {
      "address": this.direccion,
      "date_birth": this.fecha,
      "first_name": this.nombre,
      "last_name": this.apellidos,
      "latitude": this.latitud,
      "longitude": this.longitud,
      "stature": this.estatura
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("patients");
    collectionReference.add(pat).whenComplete(() {
      print("registrado");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Añadir Paciente"),
        ),
        body: new Column(children: <Widget>[
          Text(""),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // initialValue: '',
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
              // initialValue: '',
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
              // initialValue: '',
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
              // initialValue: '',
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
              // initialValue: '',
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
              // initialValue: '',
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
              // initialValue: '',
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'longitud',
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.home,
                ),
              ),
              onChanged: (String longitud) {
                getlongitud(longitud);
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
                createPatients();
                Navigator.pop(context);
              },
              icon: Icon(Icons.save, size: 18),
              label: Text("GUARDAR"),
            ),
          )
        ]));
  }
}
