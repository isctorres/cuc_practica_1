import 'package:cuc1/database/database_helper.dart';
import 'package:cuc1/models/student_model.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  DatabaseHelper? _database;
  TextEditingController txtNomCon = TextEditingController();
  TextEditingController txtEmailCon = TextEditingController();
  TextEditingController txtPwdCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    _database = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    final imgFoto = CircleAvatar(
      radius: 100,
      child: Image.network(
          'https://cdn4.iconfinder.com/data/icons/professions-1-2/151/8-512.png'),
    );

    final txtNombre = TextFormField(
      controller: txtNomCon,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        label: Text("Introduce el nombre"),
      ),
    );

    final txtEdad = TextFormField(
      controller: txtEmailCon,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        label: Text("Introduce el correo electrónico"),
      ),
    );

    final txtPwd = TextFormField(
      controller: txtPwdCon,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: const InputDecoration(
        label: Text("Introduce el password"),
      ),
    );

    final btnAgregar = ElevatedButton(
      onPressed: () {
        var objStudent = StudentDAO(
            email: txtEmailCon.text,
            noctrl: 0,
            nombre: txtNomCon.text,
            password: txtPwdCon.text);
        _database!.insStudent(objStudent).then((value) {
          if (value > 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Alumno registrado!!!'),
              ),
            );
          }
        });
      },
      child: const Text('Agregar'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Estudiante'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        shrinkWrap: true,
        children: [
          imgFoto,
          const SizedBox(
            height: 10,
          ),
          txtNombre,
          const SizedBox(
            height: 10,
          ),
          txtEdad,
          const SizedBox(
            height: 10,
          ),
          btnAgregar,
        ],
      ),
    );
  }
}
