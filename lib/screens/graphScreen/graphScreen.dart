import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thermo/screens/graphScreen/customBarGraph.dart';
import 'package:thermo/screens/graphScreen/customPieChart.dart';
import 'package:thermo/state/appState.dart';

/**
 * Features to build::
 * graph showing temperature of people b/w 5 different classes
 *  average temperature of all staff type
 */
Color getTempRangeColor(double temp) {
  if (temp > 103)
    return Colors.red;
  else if (temp > 101 && temp < 103)
    return Colors.orange;
  else if (temp > 100 && temp < 101)
    return Colors.yellow;
  else if (temp > 98 && temp < 100)
    return Colors.lightGreen;
  else if (temp > 97)
    return Colors.teal;
  else
    return Colors.blue;
}

class GraphScreen extends StatefulWidget {
  final AppState appState;

  GraphScreen(this.appState);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomBarGraphs(widget.appState),
              CustomPieChart(widget.appState)
            ],
          ),
        ),
      ),
    );
  }
}


