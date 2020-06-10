import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:thermo/model/person.dart';
import 'dart:ui';

class AppState with ChangeNotifier{
  List<Person> people = [];

  void add(Person person){
    this.people.add(person);
    notifyListeners();
  }

}

