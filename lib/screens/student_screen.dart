import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    final imgFoto = CircleAvatar(
      radius: 100,
      child: Image.network(
          'https://cdn4.iconfinder.com/data/icons/professions-1-2/151/8-512.png'),
    );

    final txtNombre = TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        label: Text("Introduce el nombre"),
      ),
    );

    final txtEdad = TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text("Introduce la edad"),
      ),
    );

    final btnAgregar = ElevatedButton(
      onPressed: () {},
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
