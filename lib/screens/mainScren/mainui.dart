import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/screens/mainScren/filterPopup.dart';
import 'package:thermo/screens/mainScren/header.dart';
import 'package:thermo/screens/mainScren/listArea.dart';
import 'package:thermo/state/appState.dart';

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

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: lightColor,
          child: ChangeNotifierProvider<AppState>(
            create: (context) => AppState(),
            child: Column(
              children: <Widget>[
                Header(),
                ListArea(),
                BottomArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}