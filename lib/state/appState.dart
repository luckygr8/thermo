import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thermo/const/connection.dart';
import 'package:thermo/const/functions.dart';
import 'package:thermo/model/person.dart';

class AppState with ChangeNotifier {

  AppState(){
    Connection.getPersons(today(), this);
  }

  List<Person> people = []; // list which has all the records
  List<Person> filtered = []; // list which has just the filtered records

  void updateList(List<Person> newList) {
    this.people = newList;
    this.filtered = newList;
    notifyListeners();
  }

  void updateFilteredList(List<Person> newList) {
    this.filtered = newList;
    print(filtered);
    print(filtered.length);
    notifyListeners();
  }

  // FILTERS //
  String date = '';

  RangeValues tempRange = RangeValues(95, 105);

  List<String> types = [
    PersonType.student,
    PersonType.teacher,
    PersonType.staff,
    PersonType.visitor,
    PersonType.other
  ];

  void initFilters(){
    date = '';
    tempRange = RangeValues(95, 105);
    types = [
      PersonType.student,
      PersonType.teacher,
      PersonType.staff,
      PersonType.visitor,
      PersonType.other
    ];
  }

  void typeFilter(String type) {
    if (types.contains(type))
      types.remove(type);
    else
      types.add(type);

    print(types);
    notifyListeners();
  }

  void temperatureFilter(RangeValues range) {
    this.tempRange = range;
    print(this.tempRange);
    notifyListeners();
  }

  void dateFilter(String date){
    this.date = date;
    print(this.date);
    notifyListeners();
  }

  void applyTypeFilter(){
    List<Person> list = [];
    for(Person p in people){
      if(this.types.contains(p.type))
        list.add(p);
    }
    updateFilteredList(list);
  }

  void applyDateFilter(){
    List<Person> list = [];
    for(Person p in people){
      if(p.date==this.date)
        list.add(p);
    }
    updateFilteredList(list);
  }
  void applyTemperatureFilter(){
    List<Person> list = [];
    for(Person p in people){
      if(p.temperature>=tempRange.start && p.temperature<=tempRange.end)
        list.add(p);
    }
    updateFilteredList(list);
  }

  void everyFilter(){
    applyTypeFilter();
    applyTemperatureFilter();
    applyDateFilter();
  }

}
