import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:intl/intl.dart';

String today(){
  var now = new DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

void vibrate() async{
  Vibrate.vibrate();
}
//dd-mm-yyyy
int _getYear(String date){
  return int.parse(date.substring(6,date.length));
}
int _getMonth(String date){
  return int.parse(date.substring(3,5));
}
int _getDay(String date){
  return int.parse(date.substring(0,2));
}
