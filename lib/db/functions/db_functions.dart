import 'package:flutter/material.dart';
import 'package:flutter_sqflite/model/data_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);
late Database _db;

Future<void> initDatabase() async {
  _db = await openDatabase('student.db', version: 1, onCreate: (db, version) async {
    await db.execute("CREATE TABLE student(id INTEGER PRIMARY KEY, name TEXT, age TEXT)");
  });
}

Future<void> addStudent(StudentModel value) async {
  await _db.rawInsert("INSERT INTO student(name, age) VALUES(?, ?)", [value.name, value.age]);
  await getAllStudents();
}

Future<void> getAllStudents() async {
  final List<Map<String, dynamic>> _values = await _db.rawQuery("SELECT * FROM student");

  final List<StudentModel> students = _values.map((map) {
    return StudentModel.fromMap(map);
  }).toList();

  studentListNotifier.value = students;
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  await _db.delete('student', where: 'id = ?', whereArgs: [id]);
  await getAllStudents();
}
