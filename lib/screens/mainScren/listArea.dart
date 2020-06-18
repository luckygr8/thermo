import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermo/components/listItem.dart';
import 'package:thermo/components/roundChip.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/connection.dart';
import 'package:thermo/const/functions.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/model/person.dart';
import 'package:thermo/state/appState.dart';

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
              DateTime today = DateTime.now();
              CustomDateTime cdt = CustomDateTime(year: today.year,month: today.month,day: today.day);
              Connection.getPersonsBySingleDate(cdt, state);
            });
          },
          child: (state.filtered.isEmpty)
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
            SizedBox(
              height: DeviceSize.size.height * .02,
            ),
            NormalText('* this will load today\'s records \n for a more advanced search, select date filters', darkColor, 1.3),
          ],
        )
      ],
    );
  }
}