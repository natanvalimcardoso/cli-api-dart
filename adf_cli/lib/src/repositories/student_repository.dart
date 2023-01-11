import 'package:dio/dio.dart';

import '../models/student.dart';

class StudentRepository {
  //* ----------------------// Puxar uma lista com todos estudantes. //---------------------- *//
  Future<List<Student>> findAll() async {
    final studentsResult = await Dio().get('http://localhost:8080/students');

    try {
      return studentsResult.data.map<Student>((student) {
        return Student.fromMap(student);
      }).toList();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  //* -----------------// Puxa o objeto estudante de acordo com id passado. //---------------------- *//
  Future<Student> findById(int id) async {
    final studentResult = await Dio().get('http://localhost:8080/students/:$id');

    try {
      if (studentResult.data == null) {
        throw Exception('Estudante não encontrado!');
      }
      return Student.fromMap(studentResult.data);
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  //* ----------------------// Insere o valor //---------------------- *//
  Future<void> insert(Student student) async {
    try {
      await Dio().post(
        'http://localhost:8080/students',
        data: student.toMap(),
      );
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  //* ----------------------// Atualiza o dado de acordo com id passado // ---------------------- *//
  Future<void> update(Student student) async {
    try {
      await Dio().put(
        'http://localhost:8080/students/${student.id}',
        data: student.toMap(),
      );
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  //* ----------------------// deleta o dado de acordo com id passado // ---------------------- *//
  Future<void> deleteById(int id) async {
    try {
      await Dio().delete(
        'http://localhost:8080/students/$id',
      );
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}
