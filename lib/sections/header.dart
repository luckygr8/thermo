import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';
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
                  child: Container(
                    child: Center(
                      child: NormalText('thermo', lightColor, 4),
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
                        child: Container(
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
                      ),
                      Expanded(
                          flex: 30,
                          child: Padding(
                            padding: EdgeInsets.all(DeviceSize.size.width * .1),
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: lightColor,
                                  borderRadius: BorderRadius.circular(
                                      DeviceSize.size.width)),
                              child: Icon(Icons.apps),
                            ),
                          )),
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
