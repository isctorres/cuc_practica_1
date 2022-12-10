import 'dart:io';
import 'package:cuc1/models/student_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _nombreBD = "CUCBD";
  static final _versionBD = 1;
  static final _nombreTBL = "tblEstudiantes";

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database; // singleton
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory carpeta = await getApplicationDocumentsDirectory();
    String rutaBD = join(carpeta.path, _nombreBD);
    return openDatabase(
      rutaBD,
      version: _versionBD,
      onCreate: _crearTabla,
    );
  }

  Future<void> _crearTabla(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $_nombreTBL(noctrl INTEGER PRIMARY KEY,nombre VARCHAR(60), email VARCHAR(30), password VARCHAR(64))",
    );
  }

  Future<int> insStudent(StudentDAO objStudent) async {
    var conexion = await database;
    return conexion!.insert(_nombreTBL, objStudent.toMap());
  }

  Future<int> updStudent(StudentDAO objStudent) async {
    var conexion = await database;
    return conexion!.update(_nombreTBL, objStudent.toMap(),
        where: 'noctrl = ?', whereArgs: [objStudent.noctrl]);
  }

  Future<int> delStudent(StudentDAO objStudent) async {
    var conexion = await database;
    return conexion!.delete(_nombreTBL,
        where: 'noctrl = ?', whereArgs: [objStudent.noctrl]);
  }

  Future<List<StudentDAO>> listStudents() async {
    var conexion = await database;
    var result = await conexion!.query(_nombreTBL);
    return result.map((student) => StudentDAO.fromMap(student)).toList();
  }
}
