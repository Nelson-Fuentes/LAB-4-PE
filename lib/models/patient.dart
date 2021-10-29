import 'dart:core';

class Patient {
  late String lastName;
  late String firstName;
  late String dateBirth;
  late num stature;
  late String address;
  late num latitude;
  late num longitude;

  Patient(this.lastName, this.firstName, this.dateBirth, this.stature,
      this.address, this.latitude, this.longitude);
}