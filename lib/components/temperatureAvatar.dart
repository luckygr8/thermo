import 'package:flutter/material.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';

class TemperatureAvatar extends StatelessWidget {
  final String temperature;

  TemperatureAvatar(this.temperature);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 20,
      child: Padding(
        padding: EdgeInsets.all(0), //DeviceSize.size.width * 0.02
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            decoration: BoxDecoration(
                color: primaryColorDark,
                borderRadius: BorderRadius.circular(constraints.maxWidth),
                boxShadow: [BoxShadow(color: primaryColorDark, blurRadius: 2)]),
            child: Center(
              child: Text(
                temperature,
                style: TextStyle(
                    fontFamily: 'Comforta',
                    fontSize: constraints.maxWidth / 4,
                    color: lightColor),
              ),
            ),
            height: DeviceSize.size.height * 0.09,
            width: DeviceSize.size.width * 0.05,
          ),
        ),
      ),
    );
  }
}