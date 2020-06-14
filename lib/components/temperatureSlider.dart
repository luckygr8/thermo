import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/state/appState.dart';
import 'package:thermo/state/filterState.dart';

class TemperatureSlider extends StatefulWidget {
  TemperatureSlider(this.appState);
  final AppState appState;
  @override
  _TemperatureSliderState createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {
  RangeValues range = RangeValues(95, 105);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: range,
      onChanged: (RangeValues value) {
        setState(() {
          range = value;
          widget.appState.temperatureFilter(value);
        });
      },
      activeColor: darkColor,
      inactiveColor: lightColor,
      min: 95,
      max: 105,
      divisions: 100,
      labels: RangeLabels(range.start.toString(), range.end.toString()),
    );
  }
}
