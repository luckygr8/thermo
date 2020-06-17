import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:provider/provider.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/state/appState.dart';
import 'package:thermo/state/filterState.dart';
import 'package:thermo/const/functions.dart' as func;

class RoundedChip extends StatefulWidget {
  final String text;
  final AppState appState;
  RoundedChip(this.text,this.appState);

  @override
  _RoundedChipState createState() => _RoundedChipState();
}

class _RoundedChipState extends State<RoundedChip> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          func.vibrate();
          selected = !selected;
          widget.appState.typeFilter(widget.text);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color:
                selected ? darkColor : primaryColor,
            borderRadius: BorderRadius.circular(DeviceSize.ppi * 4)),
        padding: EdgeInsets.all(DeviceSize.ppi * 4),
        child: NormalText(widget.text,
            selected ? lightColor : darkColor, 1.5),
      ),
    );
  }
}
