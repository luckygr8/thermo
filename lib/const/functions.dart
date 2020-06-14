import 'package:intl/intl.dart';

String today(){
  var now = new DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');
  String formattedDate = formatter.format(now);
  return formattedDate;
}