import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/functions.dart';
import 'package:thermo/const/sizes.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String date = today();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(DeviceSize.ppi * 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.calendar_today),
            NormalText(date, darkColor, 1.7),
          ],
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(DeviceSize.ppi * 5),
        ),
      ),
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.utc(1990, 1, 1),
          lastDate: DateTime.utc(2021, 12, 31),
        ).then((value){
          if(value==null)
            return;
          setState(() {
            var formatter = new DateFormat('dd-MM-yyyy');
            date = formatter.format(value);
          });
        });
      },
      onLongPress: (){
        setState(() {
          date = today();
        });
      },
    );
  }
}