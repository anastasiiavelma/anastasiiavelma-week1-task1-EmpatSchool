import 'package:flutter/foundation.dart';
import 'package:week1_task1/models/person.dart';

class Student extends Person {
  String school;
  int studentId;

  @override
  set name(String value) {
    super.name = value.toLowerCase();
  }

  Student({
    required String name,
    required String surname,
    required DateTime birth,
    required int age,
    required this.studentId,
    required this.school,
  }) : super(
          name: name,
          surname: surname,
          birth: birth,
          age: age,
        );

  @override
  void display() {
    if (kDebugMode) {
      print("Name: $name  Age: $age");
      print("School: $school");
    }
  }
}
