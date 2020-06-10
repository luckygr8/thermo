import 'package:flutter/material.dart';
import 'package:thermo/const/colors.dart';
class TemperatureSlider extends StatefulWidget {
  @override
  _TemperatureSliderState createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {
  RangeValues range = RangeValues(33,37);
  RangeLabels tags = RangeLabels('33', '37');
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: range,
      onChanged: (RangeValues value) {
        setState(() {
          range = value;
          tags = RangeLabels(value.start.toString(),value.end.toString());
        });
      },
      activeColor: darkColor,
      inactiveColor: lightColor,
      min: 30,
      max: 40,
      divisions: 100,
      labels: tags,
    );
  }
}