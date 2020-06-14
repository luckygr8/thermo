import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thermo/model/person.dart';
import 'package:thermo/state/appState.dart';

class FilterState with ChangeNotifier {
  final AppState _appState;

  FilterState(this._appState);

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
    print(range);
    notifyListeners();
  }

/*void typeFilter(String type, int action) {
    if (action == 1) {
      if (!_types.contains(type)) _types.add(type);
    } else {
      _types.remove(type);
    }
    print(_types);
    List<Person> list = [];
    for (Person p in _appState.people) {
      for (String t in _types) {
        if(p.type==t)
          list.add(p);
          break;
      }
    }
    print("filtered $list");
    _appState.updateFilteredList(list);
    notifyListeners();
  }

  void dateFilter(String date) {
    _date = date;
    notifyListeners();
  }

  void temperatureFilter(double lower, double upper) {
    _tempUpper = lower;
    _tempLower = upper;

    List<Person> list = [];
    for (Person p in _appState.people)
      if (p.temperature >= lower && p.temperature <= upper) list.add(p);

    _appState.updateFilteredList(list);

    notifyListeners();
  }*/
}
