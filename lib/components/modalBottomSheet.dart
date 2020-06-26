import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermo/components/applyFilterButton.dart';
import 'package:thermo/components/customCheckBoxTile.dart';
import 'package:thermo/components/datePicker.dart';
import 'package:thermo/components/listItem.dart';
import 'package:thermo/components/roundChip.dart';
import 'package:thermo/components/temperatureSlider.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/state/appState.dart';
import 'package:thermo/state/filterState.dart';

class ModalBottomSheet extends StatelessWidget {
  final AppState _appState;

  ModalBottomSheet(this._appState);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.add,
              color: lightColor,
            ),
            Text(
              'FILTERS',
              style: TextStyle(
                  fontFamily: 'Comforta',
                  fontSize: DeviceSize.size.width / 25,
                  color: lightColor),
            )
          ],
        ),
      ),
      onTap: () {
        _appState.initFilters();
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isDismissible: true,
          context: context,
          builder: (context) => Container(
            decoration: BoxDecoration(
              color: primaryColorDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(DeviceSize.size.width * 0.05),
                topRight: Radius.circular(DeviceSize.size.width * 0.05),
              ),
            ),
            height: DeviceSize.size.height,
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(DeviceSize.ppi * 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      NormalText('APPLY FILTERS', lightColor, 2),
                      SizedBox(
                        height: DeviceSize.size.height * 0.05,
                      ),
                      CustomCheckBoxTile('people who enter JMIT',Icons.assignment_returned,_appState.applyEntryInFilter),
                      CustomCheckBoxTile('people who leave JMIT',Icons.exit_to_app,_appState.applyEntryOutFilter),
                      SizedBox(
                        height: DeviceSize.size.height * 0.03,
                      ),
                      NormalText('staff type : all selected by default',
                          lightColor, 1.5),
                      SizedBox(
                        height: DeviceSize.size.height * 0.03,
                      ),
                      Wrap(
                        spacing: DeviceSize.ppi * 4,
                        runSpacing: DeviceSize.ppi * 4,
                        children: <Widget>[
                          RoundedChip('student', _appState),
                          RoundedChip('teacher', _appState),
                          RoundedChip('staff', _appState),
                          RoundedChip('other', _appState),
                          RoundedChip('visitor', _appState),
                        ],
                      ),
                      SizedBox(
                        height: DeviceSize.size.height * 0.03,
                      ),
                      ApplyFilterButton(
                          'apply type filter', _appState.applyTypeFilter),
                      SizedBox(
                        height: DeviceSize.size.height * 0.03,
                      ),
                      NormalText('search by id : type an ID in the box below',
                          lightColor, 1.5),
                      SizedBox(
                        height: DeviceSize.size.height * 0.06,
                      ),
                      TextFormField(
                        cursorColor: darkColor,
                        onChanged: (value) => _appState.searchID = value,
                        style: TextStyle(
                            fontSize: DeviceSize.size.width / 25,
                            color: lightColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comforta'),
                        decoration: InputDecoration(
                            fillColor: darkColor,
                            focusColor: primaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 2)),
                            labelText: 'ID goes here',
                            labelStyle: TextStyle(
                                fontSize: DeviceSize.size.width / 28,
                                color: lightColor,
                                fontFamily: 'Comforta')),
                      ),
                      SizedBox(
                        height: DeviceSize.size.height * 0.04,
                      ),
                      ApplyFilterButton(
                          'search using ID', _appState.applySearchIdFilter),
                      SizedBox(
                        height: DeviceSize.size.height * 0.06,
                      ),
                      NormalText('temperature : 95 to 105 by default',
                          lightColor, 1.5),
                      SizedBox(
                        height: DeviceSize.size.height * 0.02,
                      ),
                      TemperatureSlider(_appState),
                      SizedBox(
                        height: DeviceSize.size.height * 0.03,
                      ),
                      ApplyFilterButton('apply temperature filter',
                          _appState.applyTemperatureFilter),
                      SizedBox(
                        height: DeviceSize.size.height * 0.06,
                      ),
                      NormalText('pick date : default is current date',
                          lightColor, 1.5),
                      SizedBox(
                        height: DeviceSize.size.height * 0.02,
                      ),
                      DatePicker(_appState),
                      SizedBox(
                        height: DeviceSize.size.height * 0.03,
                      ),
                      ApplyFilterButton(
                          'apply date filter', _appState.applyDateFilter),
                      SizedBox(
                        height: DeviceSize.size.height * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
