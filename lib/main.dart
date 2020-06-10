import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thermo/components/modalBottomSheet.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/model/person.dart';
import 'const/colors.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: MainUI(),
        ),
      ),
    );
  }
}

class MainUI extends StatefulWidget {
  @override
  _MainUIState createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double ppi = MediaQuery.of(context).devicePixelRatio;

    DeviceSize.setDimens(ppi, size);

    return Container(
      color: lightColor,
      child: Column(
        children: <Widget>[
          Header(),
          ListArea(),
          BottomArea(),
        ],
      ),
    );
  }
}

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                                      'total records : 200', lightColor, 1.5),
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
                        )),
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
    );
  }
}

class ListArea extends StatefulWidget {
  @override
  _ListAreaState createState() => _ListAreaState();
}

class _ListAreaState extends State<ListArea> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 65,
      child: ListView.builder(
        itemCount: testArray.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(DeviceSize.size.width * 0.05),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(DeviceSize.size.width * 0.05),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: DeviceSize.ppi * 6),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 75,
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
                                NormalText(testArray[index].id, darkColor, 1.7),
                                SizedBox(
                                  width: DeviceSize.size.width * 0.05,
                                ),
                                StampText(testArray[index].type),
                              ],
                            ),
                          ),
                          NormalText(testArray[index].name, darkColor, 1.8),
                        ],
                      ),
                    ),
                  ),
                ),
                TemperatureAvatar(testArray[index].temperature.toString()),
                SizedBox(
                  width: DeviceSize.size.width * 0.04,
                )
              ],
            ),
          ),
          height: DeviceSize.size.height * 0.12,
        ),
      ),
    );
  }
}

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

class BottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColorDark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(DeviceSize.size.width * 0.05),
              topRight: Radius.circular(DeviceSize.size.width * 0.05),
            ),
            boxShadow: [BoxShadow(color: primaryColorDark, spreadRadius: 2)]),
        child: ModalBottomSheet(),
      ),
    );
  }
}
