import 'package:cuc1/database/database_helper.dart';
import 'package:cuc1/models/student_model.dart';
import 'package:flutter/material.dart';

class ListStudentsScreen extends StatefulWidget {
  ListStudentsScreen({Key? key}) : super(key: key);

  @override
  State<ListStudentsScreen> createState() => _ListStudentsScreenState();
}

class _ListStudentsScreenState extends State<ListStudentsScreen> {
  DatabaseHelper? _database;

  @override
  void initState() {
    super.initState();
    _database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: FutureBuilder(
        future: _database!.listStudents(),
        builder: (context, AsyncSnapshot<List<StudentDAO>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].nombre!),
                );
              },
            );
          } else {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Ocurrió un error'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
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
