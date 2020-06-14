import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thermo/components/modalBottomSheet.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';
import 'package:thermo/state/appState.dart';

class BottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) => Expanded(
        flex: 10,
        child: Container(
          decoration: BoxDecoration(
              color: primaryColorDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(DeviceSize.size.width * 0.05),
                topRight: Radius.circular(DeviceSize.size.width * 0.05),
              ),
              boxShadow: [BoxShadow(color: primaryColorDark, spreadRadius: 2)]),
          child: ModalBottomSheet(state),
        ),
      ),
    );
  }
}