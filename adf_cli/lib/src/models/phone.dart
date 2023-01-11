// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Phone {
  final int ddd;
  final String phone;

  Phone({
    required this.ddd,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'phone': phone,
    };
  }

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      ddd: map['ddd'] ?? 0,
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Phone.fromJson(String source) => Phone.fromMap(json.decode(source));
}
