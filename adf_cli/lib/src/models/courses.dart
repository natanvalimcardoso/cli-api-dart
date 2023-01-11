import 'dart:convert';

class Courses {
  final int id;
  final String name;
  final bool isStudent;
  
  Courses({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isStudent': isStudent,
    };
  }

  factory Courses.fromMap(Map<String, dynamic> map) {
    return Courses(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      isStudent: map['isStudent'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Courses.fromJson(String source) => Courses.fromMap(json.decode(source));
}
