import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thermo/const/connection.dart';
import 'package:thermo/model/person.dart';

class AppState with ChangeNotifier {
  AppState() {
    //Connection.getPersons(today(), this);
  }

  //List<Person> filtered = []; // list which has just the filtered records

  List<Person> filtered = [
    Person(
        name: 'lakshay',
        type: PersonType.student,
        temperature: 92,
        entry: 'out',
        date: CustomDateTime(day: 12,month: 6,year: 2020),
        id: '1217250'),
  ];

  void updateFilteredList(List<Person> newList) {
    this.filtered = newList;
    print('fetched ${filtered.length} records which are \n $filtered');
    notifyListeners();
  }

  // FILTERS //
  CustomDateTime date1;
  CustomDateTime date2;

  RangeValues tempRange = RangeValues(95, 105);

  List<String> types = [
    /*PersonType.student,
    PersonType.teacher,
    PersonType.staff,
    PersonType.visitor,
    PersonType.other*/
  ];

  String searchID;

  void initFilters() {
    date1 = null;
    date2 = null;
    tempRange = RangeValues(95, 105);
    types = [
      /*PersonType.student,
      PersonType.teacher,
      PersonType.staff,
      PersonType.visitor,
      PersonType.other*/
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

  void dateFilter(CustomDateTime date1, CustomDateTime date2) {
    this.date1 = date1;
    this.date2 = date2;
    print('$date1 to $date2');
    notifyListeners();
  }

  void applySearchIdFilter() {
    print(this.searchID);
    List<Person> list = [];
    for(Person p in filtered){
      if(p.id==searchID)
        list.add(p);
    }
    updateFilteredList(list);
  }

  void applyTypeFilter() {
    List<Person> list = [];
    for (Person p in filtered) {
      if (!this.types.contains(p.type)) list.add(p);
    }
    updateFilteredList(list);
  }

  void applyDateFilter() {
    Connection.getPersonsByDate(this.date1, this.date2, this);
    //List<Person> list = [];
    /*for(Person p in filtered){
      if(p.date.compareTo(date1)>1 && p.date.compareTo(date2)<-1)
        list.add(p);
    }*/
    //updateFilteredList(list);
  }

  void applyTemperatureFilter() {
    List<Person> list = [];
    for (Person p in filtered) {
      if (p.temperature >= tempRange.start && p.temperature <= tempRange.end)
        list.add(p);
    }
    updateFilteredList(list);
  }

  void applyEntryInFilter(){
    List<Person> list = [];
    for (Person p in filtered) {
      if (p.entry!='in')
        list.add(p);
    }
    updateFilteredList(list);
  }

  void applyEntryOutFilter(){
    List<Person> list = [];
    for (Person p in filtered) {
      if (p.entry!='out')
        list.add(p);
    }
    updateFilteredList(list);
  }

  void everyFilter() {
    applyTypeFilter();
    applyTemperatureFilter();
    applyDateFilter();
  }
}
