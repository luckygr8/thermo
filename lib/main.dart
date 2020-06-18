import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thermo/screens/mainScren/mainui.dart';


void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/main': (_)=> MainUI(),
      },
      initialRoute: '/main',
    );
  }
}

