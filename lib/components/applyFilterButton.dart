import 'package:flutter/material.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/state/appState.dart';

class ApplyFilterButton extends StatelessWidget {
  final Function todo;
  final String label;
  ApplyFilterButton(this.label,this.todo);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DeviceSize.ppi * 3),
        boxShadow: [
          BoxShadow(color: darkColor, spreadRadius: 1, blurRadius: 5)
        ],
        color: primaryColor,
      ),
      child: FlatButton(
        onPressed: todo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(DeviceSize.ppi*2),
              child: Icon(Icons.done_outline),
            ),
            Padding(
              padding: EdgeInsets.all(DeviceSize.ppi*2),
              child: NormalText(label, darkColor, 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
