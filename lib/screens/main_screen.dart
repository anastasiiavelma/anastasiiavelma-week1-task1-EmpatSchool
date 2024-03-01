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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Student Details',
        )),
        surfaceTintColor: Colors.white,
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
              child: ListView.builder(
                  itemCount: studentDetails.length,
                  itemBuilder: (context, index) {
                    Student student = studentDetails[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                      child: StudentWidget(student: student),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
