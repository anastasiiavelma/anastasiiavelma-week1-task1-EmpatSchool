import 'package:flutter/foundation.dart';

class Person {
  final String name;
  final String _surname;
  final DateTime _birth;
  final int _age;

  String get surname => _surname;
  int get age => _age;
  DateTime get birth => _birth;

// Name is written in lower case
  set name(String value) {
    name = value.toLowerCase();
  }

  Person({
    required String name,
    required String surname,
    required DateTime birth,
    required int age,
  })  : name = name.toLowerCase(),
        _surname = surname,
        _birth = birth,
        _age = age;

  void display() {
    if (kDebugMode) {
      print("Name: $name  Age: $age");
    }
  }
}
