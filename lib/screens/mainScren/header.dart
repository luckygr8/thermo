import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/screens/graphScreen/graphScreen.dart';
import 'package:thermo/state/appState.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) => Expanded(
        flex: 25,
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(DeviceSize.size.width * .1),
                bottomRight: Radius.circular(DeviceSize.size.width * .1),
              ),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 35,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        NormalText('thermo', lightColor, 4),
                        SizedBox(
                          width: DeviceSize.size.width * .08,
                        ),
                        GestureDetector(
                          onTap: () {
                            showAboutDialog(
                              context: context,
                              applicationLegalese:
                                  'This software is designed with JMIT and it\'s staff'
                                  ' in mind. This is the first stable version of thermo.'
                                  ' for any updations, contact lead dev \n'
                                  ' LAKSHAY 1217250',
                              applicationName: 'thermo',
                              applicationVersion: '1.0.0',
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                NormalText('THIS IS A PRE-PRODUCTION VERSION',
                                    darkColor, 1.4)
                              ],
                              applicationIcon: SizedBox(
                                child: Image.asset('assets/thermometer.png'),
                                height: DeviceSize.size.height * .1,
                                width: DeviceSize.size.width * .1,
                              ),
                            );
                          },
                          child: Icon(
                            Icons.info,
                            color: lightColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 70,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: NormalText(
                                    'total records : ${state.filtered.length}',
                                    lightColor,
                                    1.5),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: NormalText(
                                    'overall report: good', lightColor, 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 30,
                        child: Padding(
                          padding: EdgeInsets.all(DeviceSize.size.width * .1),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GraphScreen(state),
                                ),
                              );
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: lightColor,
                                  borderRadius: BorderRadius.circular(
                                      DeviceSize.size.width)),
                              child: Icon(Icons.apps),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
