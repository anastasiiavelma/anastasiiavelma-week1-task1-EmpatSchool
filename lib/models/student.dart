import 'package:flutter/foundation.dart';
import 'package:week1_task1/models/person.dart';

mixin DisplayMixin {
  void displayMessage(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}

// Використання міксина
class Student extends Person with DisplayMixin {
  String school;
  int studentId;

// Конструктор ініціалізації
  Student({
    required String name,
    required String surname,
    DateTime? birth,
    int? age,
    required this.studentId,
    required this.school,
  }) : super(
          name: name,
          surname: surname,
          birth: birth ?? DateTime.now(),
          age: age ?? 18,
        ) {
    // Використання assert
    assert(age! >= 18 && age <= 101, 'Age should be between 18 and 101');
  }

// Фабричний конструктор
  factory Student.withDefaultSchool({
    required String name,
    required String surname,
    required DateTime birth,
    required int age,
    required int studentId,
  }) {
    return Student(
      name: name,
      surname: surname,
      birth: birth,
      age: age,
      studentId: studentId,
      school: 'Empat School',
    );
  }

  @override
  set name(String value) {
    super.name = value.toLowerCase();
  }

  @override
  void display() {
    if (kDebugMode) {
      print("Name: $name  Age: $age");
      print("School: $school");
    }
  }
}
