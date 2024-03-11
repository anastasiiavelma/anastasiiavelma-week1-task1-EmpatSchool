import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:week1_task1/data/students_data.dart';
import 'package:week1_task1/models/student.dart';
import 'package:week1_task1/widgets/student_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  // Set для збереження id студентів
  Set<int> uniqueStudentIds = {};

  // Map для віку студентів
  Map<int, int> studentAgeMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Student Details'),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Text('Information about all students'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 152, 110, 225),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: studentDetails.isNotEmpty
                  ? ListView.builder(
                      itemCount: studentDetails.length,
                      itemBuilder: (context, index) {
                        Student student = studentDetails[index];
                        return Dismissible(
                          key: UniqueKey(),
                          background: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              15.0,
                              20.0,
                              15.0,
                              0.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 16.0),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              // Робота з колекціями: Видалення студента
                              studentDetails.removeAt(index);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                              15.0,
                              20.0,
                              15.0,
                              0.0,
                            ),
                            child: StudentWidget(student: student),
                          ),
                        );
                      },
                    )
                  : Container(
                      alignment: Alignment.topCenter,
                      child: const Text('Oops, students list is empty'),
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // Використання лямбда функцій
        onPressed: () => _showAddStudentDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Використання замикання
  void _showAddStudentDialog(BuildContext context) {
    // Використання синтактичного цукру
    String? name;
    String? surname;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Student'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _surnameController,
                  decoration: const InputDecoration(labelText: 'Surname'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Використання assert
                assert(
                  _nameController.text.isNotEmpty,
                  'Name cannot be empty',
                );

                // Використання синтактичного цукру if/else
                name = _nameController.text.isNotEmpty
                    ? _nameController.text
                    : 'Unknown';

                surname = _surnameController.text.isNotEmpty
                    ? _surnameController.text
                    : 'Unknown';

                // Генерація ID
                int newStudentId = UniqueKey().hashCode.abs();

                // Генерація віку
                int newStudentAge = 20 + Random().nextInt(9);

                Student newStudent = Student.withDefaultSchool(
                  // Використання синтактичного цукру (Змінна точно не може бути null)
                  name: name!,
                  surname: surname!,
                  birth: DateTime.now(),
                  age: newStudentAge,
                  studentId: newStudentId,
                );

                if (!uniqueStudentIds.contains(newStudentId)) {
                  setState(() {
                    // Робота з колекціями: додавання студента, виведення довжини списку
                    studentDetails.add(newStudent);

                    // Додавання ID у список
                    uniqueStudentIds.add(newStudentId);

                    // Вік
                    studentAgeMap[newStudentId] = newStudentAge;

                    Navigator.of(context).pop();

                    if (kDebugMode) {
                      printStudentAges();
                      print('new Student with added age: $newStudentAge');
                      print('All students age: $studentAgeMap');
                      print('First ID in set: ${uniqueStudentIds.first}');
                      print(
                        'contains Student with ID 345427692: ${uniqueStudentIds.contains(345427692)}',
                      );
                      print(
                        'Map length students age: ${studentAgeMap.length}',
                      );
                      print(
                          'Length of studentDetails list: ${studentDetails.length}');
                    }
                  });
                } else {
                  if (kDebugMode) {
                    print('Student with ID $newStudentId already exists');
                  }
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

// Iterable
  void printStudentAges() {
    for (var entry in studentAgeMap.entries) {
      int studentId = entry.key;
      int age = entry.value;
      if (kDebugMode) {
        print('Student with ID $studentId has age $age');
      }
    }
  }
}
