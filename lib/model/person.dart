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
  String date;
  Person({@required this.name,@required this.temperature,@required this.id,@required this.type,@required this.date});

  factory Person.fromJSON(Map<String, dynamic> json){
    return Person(
      name: json['name'].toString(),
      date: json['date'].toString(),
      type: json['type'].toString(),
      temperature: double.parse(json['temperature']),
      id: json['id'].toString(),
    );
  }

  @override
  String toString() {
    return 'Person{name: $name, id: $id, type: $type, temperature: $temperature, date: $date}';
  }
}

/*final List<Person> testArray = [
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
  Person(id: '12712',name: 'cypher',temperature: 36.3,type: PersonType.student,date: ''),
];*/