// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:adf_cli/src/models/address.dart';
import 'package:adf_cli/src/models/courses.dart';

class Student {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Courses> courses;
  final Address address;

  Student({
    this.id,
    this.age,
    required this.name,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'nameCourses': nameCourses,
      'courses': courses.map((x) => x.toMap()).toList(),
      'address': address.toMap(),
    };

    if (age != null) {
      map['age'] = age;
    }

    return map;
  }
  
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'],
      nameCourses: List.from((map['nameCourses'] ?? <String>[])),
      address: Address.fromMap(map['address'] as Map<String, dynamic>),
      courses: map['courses']
        ?.map<Courses>((cursoMap) => Courses.fromMap(cursoMap))
        .toList() ?? <Courses>[],
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source));
}
