class StudentDAO {
  int? noctrl;
  String? nombre;
  String? email;
  String? password;

  StudentDAO({this.noctrl, this.nombre, this.email, this.password});

  Map<String, dynamic> toMap() {
    return {
      //'noctrl': noctrl,
      'nombre': nombre,
      'email': email,
      'password': password,
    };
  }

  factory StudentDAO.fromMap(Map<String, dynamic> map) {
    return StudentDAO(
      email: map['email'],
      noctrl: map['noctrl'],
      nombre: map['nombre'],
      password: map['password'],
    );
  }
}
