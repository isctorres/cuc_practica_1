import 'package:cuc1/screens/list_students_screen.dart';
import 'package:cuc1/screens/student_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListStudentsScreen(),
      routes: {
        '/student': (context) => StudentScreen(),
      },
    );
  }
}
