import 'package:flutter/cupertino.dart';

abstract class PersonType{
  static final String student = "student";
  static final String teacher = "teacher";
  static final String staff = "staff";
  static final String visitor = "visitor";
  static final String other = "other";
}

class Person{
  //@required
  String name;
  String id = 'nil';
  String type = PersonType.other;
  double temperature;
  DateTime date;
  Person({@required this.name,@required this.temperature,@required this.id,@required this.type,@required this.date});
}

final List<Person> testArray = [
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: DateTime.utc(2020,12,31)),
];