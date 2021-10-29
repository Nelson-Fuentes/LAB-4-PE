import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_pe/models/patient.dart';

class ViewPatient extends StatelessWidget {
  var patient;

  ViewPatient({Key? key, this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.patient);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Añadir Paciente"),
        ),
        body:new Column(
            children: <Widget>[
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
