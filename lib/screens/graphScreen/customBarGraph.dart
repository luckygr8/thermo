import 'package:flutter/material.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/model/person.dart';
import 'package:thermo/state/appState.dart';

class CustomBarGraphs extends StatefulWidget {

  final AppState appState;
  CustomBarGraphs(this.appState);

  @override
  _CustomBarGraphsState createState() => _CustomBarGraphsState();
}

class _CustomBarGraphsState extends State<CustomBarGraphs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: DeviceSize.size.height * .45,
      color: darkColor,
      child: Padding(
        padding: EdgeInsets.all(DeviceSize.ppi * 10),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 15,
              child: Center(
                child: NormalText(
                    'graph view of today\'s scans', lightColor, 1.5),
              ),
            ),
            Expanded(
              flex: 75,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(DeviceSize.ppi * 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: VerticalGraphBar(Colors.yellow, .3),
                      ),
                      SizedBox(
                        width: DeviceSize.ppi * 6,
                      ),
                      Expanded(
                        flex: 1,
                        child: VerticalGraphBar(Colors.green, .5),
                      ),
                      SizedBox(
                        width: DeviceSize.ppi * 6,
                      ),
                      Expanded(
                        flex: 1,
                        child: VerticalGraphBar(Colors.teal, .6),
                      ),
                      SizedBox(
                        width: DeviceSize.ppi * 6,
                      ),
                      Expanded(
                        flex: 1,
                        child: VerticalGraphBar(Colors.yellow, .7),
                      ),
                      SizedBox(
                        width: DeviceSize.ppi * 6,
                      ),
                      Expanded(
                        flex: 1,
                        child: VerticalGraphBar(Colors.yellow, .9),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: NormalText('93-94', lightColor, 1.2),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: NormalText('95-96', lightColor, 1.2),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: NormalText('97-98', lightColor, 1.2),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: NormalText('98+', lightColor, 1.2),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: NormalText(
                            PersonType.other, lightColor, 1.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class VerticalGraphBar extends StatefulWidget {
  final Color _color;
  final double _factor;

  VerticalGraphBar(this._color, this._factor);

  @override
  _VerticalGraphBarState createState() => _VerticalGraphBarState();
}

class _VerticalGraphBarState extends State<VerticalGraphBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animation = Tween<double>(begin: 0, end: widget._factor)
        .chain(CurveTween(curve: Curves.easeInOutCirc))
        .animate(_controller);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: BoxDecoration(
          color: widget._color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(DeviceSize.ppi * 7),
            topRight: Radius.circular(DeviceSize.ppi * 7),
            bottomRight: Radius.circular(DeviceSize.ppi * 3),
            bottomLeft: Radius.circular(DeviceSize.ppi * 3),
          ),
        ),
        height: constraints.maxHeight * _animation.value,
        child: Center(
          child: NormalText('${widget._factor * 100}', darkColor, 1.5),
        ),
      ),
    );
  }
}
