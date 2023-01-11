import 'package:adf_cli/src/models/address.dart';
import 'package:adf_cli/src/models/courses.dart';

class Student {
  final int id;
  final String name;
  final int age;
  final List nameCourses;
  final List<Courses> courses;
  final Address address;

  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });
}
