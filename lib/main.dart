import 'package:flutter/material.dart';
import 'package:lab_pe/views/add_patient.dart';
import 'package:lab_pe/views/view_patient.dart';
import 'models/patient.dart';
import 'models/track.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatePatient()
    );
  }
}

class StatePatient extends StatelessWidget {
  const StatePatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var patients = [];
    patients.add(new Patient(
        'Summers', 'Scott', '1963-09-26', 1.8, 'Mi casa', 1.2741, 103.8172, [
          new Track('2021-10-29', 70, 36, 50, 90),
          new Track('2021-10-29', 70, 36, 50, 90),
          new Track('2021-10-29', 70, 36, 50, 90),
          new Track('2021-10-29', 70, 36, 50, 90),
          new Track('2021-10-29', 70, 36, 50, 90),
          new Track('2021-10-29', 70, 36, 50, 90),
          new Track('2021-10-29', 70, 36, 50, 90),
          new Track('2021-10-29', 70, 36, 50, 90),
          new Track('2021-10-29', 70, 36, 50, 90),
          new Track('2021-10-29', 70, 36, 50, 90),
    ]
    ));
    patients.add(new Patient(
        'Grey', 'Jean', '1963-09-26', 1.8, 'Mi casa', 1.2741, 103.8172, [
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
    ]
    ));
    patients.add(new Patient(
        'Worthington', 'Warren', '1963-09-26', 1.8, 'Mi casa', 1.2741, 103.8172, [
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
    ]
    ));
    patients.add(new Patient(
        'McCoy', 'Henry', '1963-09-26', 1.8, 'Mi casa', 1.2741, 103.8172, [
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
    ]
    ));
    patients.add(new Patient(
        'Drake', 'Robert', '1963-09-26', 1.8, 'Mi casa', 1.2741, 103.8172, [
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
      new Track('2021-10-29', 70, 36, 50, 90),
    ]
    ));

    var patient_items = <Widget>[];

    patients.forEach((patient) {
      patient_items.add(ListTile(
        leading: Icon(Icons.accessibility_rounded),
        title: Text(patient.firstName + ' ' + patient.lastName),
        subtitle: Text(patient.dateBirth + " | " + patient.stature.toString() + " | " + patient.address),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new ViewPatient(patient: patient)),
          );
        }
      ));
    });

    return Scaffold(
      // appBar: AppBar(
        //title: const Text('Lista de Pacientes'),
      //),
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Listado de Pacientes'),
        ),
        body: ListView(
          children: patient_items,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPatient()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}