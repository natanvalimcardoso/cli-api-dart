// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'city.dart';
import 'phone.dart';

class Address {
  final String street;
  final int number;
  final String zipCode;
  final City city;
  final Phone phone;
  
  Address({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.phone,
  });
}
