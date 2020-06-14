import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/state/appState.dart';
import 'package:thermo/sections/filterPopup.dart';
import 'package:thermo/sections/header.dart';
import 'package:thermo/sections/listArea.dart';
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
    );
  }
}
