import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/model/person.dart';
import 'package:thermo/state/appState.dart';

class CustomPieChart extends StatefulWidget {
  final AppState appState;

  CustomPieChart(this.appState);

  @override
  _CustomPieChartState createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  Map<String, double> dataMap = {
    PersonType.student: 0,
    PersonType.teacher: 0,
    PersonType.visitor: 0,
    PersonType.other: 0,
    PersonType.staff: 0
  };
  List<Color> colorList = [
    Colors.green,
    Colors.teal,
    Colors.orange,
    Colors.yellow,
    Colors.amber
  ];

  @override
  void initState() {
    for (Person p in widget.appState.filtered) {
      switch (p.type) {
        case PersonType.student:
          dataMap[PersonType.student]++;
          break;
        case PersonType.teacher:
          dataMap[PersonType.teacher]++;
          break;
        case PersonType.staff:
          dataMap[PersonType.staff]++;
          break;
        case PersonType.visitor:
          dataMap[PersonType.visitor]++;
          break;
        case PersonType.other:
          dataMap[PersonType.other]++;
          break;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DeviceSize.size.height * .3,
      color: primaryColorDark,
      child: Center(
        child: PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 1500),
          chartLegendSpacing: 32.0,
          chartRadius: DeviceSize.size.width / 2.7,
          showChartValuesInPercentage: true,
          showChartValues: true,
          showChartValuesOutside: false,
          chartValueBackgroundColor: Colors.grey[200],
          colorList: colorList,
          showLegends: true,
          legendPosition: LegendPosition.right,
          decimalPlaces: 1,
          legendStyle: TextStyle(color: lightColor, fontFamily: 'Comforta'),
          initialAngle: 0,
          chartValueStyle: defaultChartValueStyle.copyWith(
            color: Colors.blueGrey[900].withOpacity(0.9),
          ),
          chartType: ChartType.disc,
        ),
      ),
    );
  }
}