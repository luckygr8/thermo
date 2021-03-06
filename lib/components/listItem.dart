import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thermo/components/temperatureAvatar.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/model/person.dart';

class ListItem extends StatelessWidget {
  final Person person;

  ListItem(this.person);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(DeviceSize.size.width * 0.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DeviceSize.size.width * 0.05),
          color: primaryColor),
      child: Padding(
        padding: EdgeInsets.only(left: DeviceSize.ppi * 6),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 70,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(DeviceSize.size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            NormalText(person.id, darkColor, 1.7),
                            SizedBox(
                              width: DeviceSize.size.width * 0.05,
                            ),
                            StampText(person.type),
                          ],
                        ),
                      ),
                      NormalText(person.name, darkColor, 1.8),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(person.entry=='in'?Icons.assignment_returned:Icons.exit_to_app),
                  NormalText(person.entry,darkColor,1.2)
                ],
              ),
              flex: 10,
            ),
            TemperatureAvatar(person.temperature.toString()),
            Expanded(flex: 2,child: SizedBox(),),
          ],
        ),
      ),
      height: DeviceSize.size.height * 0.12,
    );
  }
}
