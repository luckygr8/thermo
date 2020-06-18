import 'package:http/http.dart' as http;
import 'package:thermo/state/appState.dart';
import 'package:thermo/model/person.dart';
import 'dart:convert' as convert;

const SERVER_URL_FOR_SINGLE_DATE = "http://192.168.29.26:4000/singleDate"; // gives all data of today
const SERVER_URL_FOR_CUSTOM_DATE = "http://192.168.29.26:4000/customDate"; // gives data bw a range of dates

class Connection {
  static Future<void> getPersonsBySingleDate(CustomDateTime date, AppState state) async {
    var j = convert.json.encode({
      'date': date.toJson(),
    });
    var response = await http.post(SERVER_URL_FOR_SINGLE_DATE,
        body: j, headers: {"Content-Type": "application/json"});
    List<Person> people = List<Person>.from(
        convert.json.decode(response.body).map((x) => Person.fromJSON(x)));
    state.updateFilteredList(people);
  }

  static Future<void> getPersonsByDate(
      CustomDateTime d1, CustomDateTime d2, AppState state) async{
    var j = convert.json.encode({
    'date1':d1.toJson(),'date2':d2.toJson()
    });
    var response = await http.post(SERVER_URL_FOR_CUSTOM_DATE,
        body: j, headers: {"Content-Type": "application/json"});
    print(response.body);
    List<Person> people = List<Person>.from(
        convert.json.decode(response.body).map((x) => Person.fromJSON(x)));
    //people.forEach((element) {print(people);});
    state.updateFilteredList(people);
  }
}
