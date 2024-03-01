import 'dart:math';
import '../models/student.dart';

List<Student> studentDetails = [
  // Real information about me
  Student(
    studentId: Random().nextInt(40),
    name: 'Anastasiia',
    surname: 'Velma',
    birth: DateTime(2003, 02, 27),
    age: 21,
    school: 'Empat School',
  ),

  // Random students
  Student(
    studentId: Random().nextInt(40),
    name: 'Gojo',
    surname: 'Satoru',
    birth: DateTime(2000 + Random().nextInt(5), Random().nextInt(12) + 1,
        Random().nextInt(28) + 1),
    age: 20 + Random().nextInt(5),
    school: 'Empat School',
  ),
  Student(
    studentId: Random().nextInt(40),
    name: 'Jeon',
    surname: 'Jungkook',
    birth: DateTime(2000 + Random().nextInt(5), Random().nextInt(12) + 1,
        Random().nextInt(28) + 1),
    age: 20 + Random().nextInt(5),
    school: 'Empat School',
  ),
  Student(
    studentId: Random().nextInt(40),
    name: 'Ryomen',
    surname: 'Sukuna',
    birth: DateTime(2000 + Random().nextInt(5), Random().nextInt(12) + 1,
        Random().nextInt(28) + 1),
    age: 20 + Random().nextInt(5),
    school: 'Empat School',
  ),
  Student(
    studentId: Random().nextInt(40),
    name: 'Toji',
    surname: 'Fushigoruro',
    birth: DateTime(2000 + Random().nextInt(5), Random().nextInt(12) + 1,
        Random().nextInt(28) + 1),
    age: 20 + Random().nextInt(5),
    school: 'Empat School',
  ),
];
