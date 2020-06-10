import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thermo/components/datePicker.dart';
import 'package:thermo/components/roundChip.dart';
import 'package:thermo/components/temperatureSlider.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';

class ModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.add,
              color: lightColor,
            ),
            Text(
              'FILTERS',
              style: TextStyle(
                  fontFamily: 'Comforta',
                  fontSize: DeviceSize.size.width / 25,
                  color: lightColor),
            )
          ],
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isDismissible: true,
          context: context,
          builder: (context) => Container(
            decoration: BoxDecoration(
              color: primaryColorDark,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(DeviceSize.ppi * 5),
                  topRight: Radius.circular(DeviceSize.ppi * 5)),
            ),
            height: DeviceSize.size.height,
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(DeviceSize.ppi * 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      NormalText('APPLY FILTERS', lightColor, 2),
                      SizedBox(
                        height: DeviceSize.size.height * 0.05,
                      ),
                      NormalText('staff type', lightColor, 1.5),
                      SizedBox(
                        height: DeviceSize.size.height * 0.02,
                      ),
                      Wrap(
                        spacing: DeviceSize.ppi * 4,
                        runSpacing: DeviceSize.ppi * 4,
                        children: <Widget>[
                          RoundedChip('student', () {}),
                          RoundedChip('teacher', () {}),
                          RoundedChip('staff', () {}),
                          RoundedChip('other', () {}),
                          RoundedChip('visitor', () {}),
                        ],
                      ),
                      SizedBox(
                        height: DeviceSize.size.height * 0.05,
                      ),
                      NormalText('temperature', lightColor, 1.5),
                      SizedBox(
                        height: DeviceSize.size.height * 0.02,
                      ),
                      TemperatureSlider(),
                      SizedBox(
                        height: DeviceSize.size.height * 0.03,
                      ),
                      NormalText('pick date', lightColor, 1.5),
                      SizedBox(
                        height: DeviceSize.size.height * 0.02,
                      ),
                      DatePicker(),
                      SizedBox(
                        height: DeviceSize.size.height * 0.04,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


