import 'package:http/http.dart' as http;
import 'package:thermo/state/appState.dart';
import 'package:thermo/model/person.dart';
import 'dart:convert' as convert;

const SERVER_URL = "http://192.168.29.26:4000/data";

class Connection {
  static Future<void> getPersons(String date , AppState state) async {
    var j = convert.json.encode({
      'date': date,
    });
    var response = await http.post(SERVER_URL,
        body: j, headers: {"Content-Type": "application/json"});
    List<Person> people =
        List<Person>.from(convert.json.decode(response.body).map((x) => Person.fromJSON(x)));
    //people.forEach((element) {print(people);});
    state.updateList(people);
  }
}
