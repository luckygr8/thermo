import 'package:flutter/cupertino.dart';

abstract class PersonType {
  static final String student = "student";
  static final String teacher = "teacher";
  static final String staff = "staff";
  static final String visitor = "visitor";
  static final String other = "other";
}

class CustomDateTime {
  int year;
  int month;
  int day;
  int hour;
  int minute;

  CustomDateTime({@required this.year,@required this.month,@required this.day,this.hour,this.minute});

  @override
  String toString() {
    return 'CustomDateTime{year: $year, month: $month, day: $day, hour: $hour, minute: $minute}';
  }

  factory CustomDateTime.fromJSON(Map<String,dynamic> json){
    return CustomDateTime(
      year: json['year'],
      month: json['month'],
      day: json['day'],
      hour: json['hour'],
      minute: json['minute']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['day'] = this.day;
    data['hour'] = this.hour;
    data['minute'] = this.minute;
    return data;
  }

}

class Person {
  //@required
  String name;
  String id = 'nil';
  String type = PersonType.other;
  double temperature;
  CustomDateTime date;

  Person(
      {@required this.name,
      @required this.temperature,
      @required this.id,
      @required this.type,
      @required this.date});

  factory Person.fromJSON(Map<String, dynamic> json) {
    return Person(
      name: json['name'].toString(),
      //date: CustomDateTime.fromJSON(json['date']),
      date: CustomDateTime(year: 2020, month: 12, day: 12), // dummy
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
