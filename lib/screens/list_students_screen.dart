import 'package:flutter/material.dart';

class ListStudentsScreen extends StatefulWidget {
  ListStudentsScreen({Key? key}) : super(key: key);

  @override
  State<ListStudentsScreen> createState() => _ListStudentsScreenState();
}

class _ListStudentsScreenState extends State<ListStudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/student');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
