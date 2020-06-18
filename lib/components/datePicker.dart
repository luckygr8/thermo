import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/functions.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/model/person.dart';
import 'package:thermo/state/appState.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class DatePicker extends StatefulWidget {
  final AppState appState;

  DatePicker(this.appState);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String date1;
  String date2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(DeviceSize.ppi * 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.calendar_today,
              color: lightColor,
            ),
            NormalText('$date1 to $date2', lightColor, 1.5),
          ],
        ),
        decoration: BoxDecoration(
          color: darkColor,
          borderRadius: BorderRadius.circular(DeviceSize.ppi * 5),
        ),
      ),
      onTap: () async {
        DateRagePicker.showDatePicker(
            context: context,
            initialFirstDate: new DateTime.now(),
            initialLastDate:
            (new DateTime.now()).add(new Duration(days: 7)),
            firstDate: new DateTime(2020),
            lastDate: new DateTime(2022))
            .then((value) {
          CustomDateTime cdt1 = CustomDateTime(
              year: value[0].year,
              month: value[0].month,
              day: value[0].day);
          CustomDateTime cdt2 = CustomDateTime(
              year: value[1].year,
              month: value[1].month,
              day: value[1].day);
          date1 = '${cdt1.year}/${cdt1.month}/${cdt1.day}';
          date2 = '${cdt2.year}/${cdt2.month}/${cdt2.day}';
          widget.appState.dateFilter(cdt1
              , cdt2
          );
          setState(() {});
        });
      },
      onLongPress: () {
        setState(() {
          date1 = today();
          date2 = today();
        });
      },
    );
  }
}
// old onTap code
//onTap: () {
//showDatePicker(
//context: context,
//initialDate: DateTime.now(),
//firstDate: DateTime.utc(1990, 1, 1),
//lastDate: DateTime.utc(2021, 12, 31),
//).then((value){
//if(value==null)
//return;
//setState(() {
//var formatter = new DateFormat('dd-MM-yyyy');
//date = formatter.format(value);
//widget.appState.dateFilter(date);
//});
//});
//}
