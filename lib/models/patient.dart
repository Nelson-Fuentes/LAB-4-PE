import 'dart:core';

import 'package:lab_pe/models/track.dart';

class Patient {
  late String id;
  late String lastName;
  late String firstName;
  late String dateBirth;
  late num stature;
  late String address;
  late num latitude;
  late num longitude;
  late List<Track> tracks;

  Patient(this.id, this.lastName, this.firstName, this.dateBirth, this.stature,
      this.address, this.latitude, this.longitude, this.tracks);
}
