import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab_pe/views/add_patient.dart';
import 'package:lab_pe/views/view_patient.dart';
import 'models/patient.dart';
import 'models/track.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StatePatient());
  }
}

class StatePatient extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('patients').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Listado de Pacientes'),
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
                var aux_patient = new Patient(
                    document.id,
                    data["last_name"],
                    data["first_name"],
                    data["date_birth"],
                    data["stature"],
                    data["address"],
                    data["latitude"],
                    data["longitude"], []);

                return ListTile(
                  leading: Icon(Icons.accessibility_rounded),
                  title:
                      Text(aux_patient.firstName + ' ' + aux_patient.lastName),
                  subtitle: Text(aux_patient.dateBirth +
                      " | " +
                      aux_patient.stature.toString() +
                      " | " +
                      aux_patient.address),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ViewPatient(patient: aux_patient)),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPatient()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
