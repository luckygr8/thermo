import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermo/components/listItem.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/connection.dart';
import 'package:thermo/const/functions.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/state/appState.dart';

/*class ListArea extends StatefulWidget {
  @override
  _ListAreaState createState() => _ListAreaState();
}

class _ListAreaState extends State<ListArea> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  final Function _refresh = (){
    Connection.getPersons(today());
    return Future.delayed(Duration(seconds: 2));
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, value, child) => Expanded(
        flex: 65,
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
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
        ),
      ),
    );
  }
}*/

class ListArea extends StatefulWidget {
  @override
  _ListAreaState createState() => _ListAreaState();
}

class _ListAreaState extends State<ListArea> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) => Expanded(
        flex: 65,
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () async {
            setState(() {
              Connection.getPersons(today(), state);
            });
          },
          child: (state.people.isEmpty)
              ? Center(child: NoDataFound())
              : ListView.builder(
                  itemCount: state.filtered.length,
                  itemBuilder: (context, index) =>
                      ListItem(state.filtered[index]),
                ),
        ),
      ),
    );
  }
}

class NoDataFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children:<Widget>[
        SizedBox(height: DeviceSize.size.height*0.2,),
        Column(
          children: <Widget>[
            SizedBox(
              child: Image.asset('assets/thermometer.png'),
              height: DeviceSize.size.height * 0.1,
            ),
            SizedBox(
              height: DeviceSize.size.height * .04,
            ),
            NormalText('whoopsies! no records found!', darkColor, 1.4),
            SizedBox(
              height: DeviceSize.size.height * .02,
            ),
            NormalText('Pull down to reload records ', darkColor, 2),
          ],
        )
      ],
    );
  }
}
