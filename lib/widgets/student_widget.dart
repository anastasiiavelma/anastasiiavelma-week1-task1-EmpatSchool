import 'package:flutter/material.dart';
import 'package:week1_task1/models/student.dart';
import 'package:intl/intl.dart';

class StudentWidget extends StatelessWidget {
  final Student student;

  const StudentWidget({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(student.birth);

    // Display data in debug console
    student.display();
    student.displayMessage('___');

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student ${student.studentId} Details',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Full name: ${student.name} ${student.surname}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Age: ${student.age}'),
                const Icon(
                  size: 30,
                  Icons.school,
                  color: Color.fromARGB(255, 152, 110, 225),
                ),
              ],
            ),
            Text('Birth: $formattedDate'),
            Text('School: ${student.school}'),
          ],
        ),
      ),
    );
  }
}
