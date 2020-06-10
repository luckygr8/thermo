import 'package:flutter/material.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';

class RoundedChip extends StatefulWidget {
  final String text;
  final Function onTap;

  RoundedChip(this.text, this.onTap);

  @override
  _RoundedChipState createState() => _RoundedChipState();
}

class _RoundedChipState extends State<RoundedChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onTap();
          isSelected = !isSelected;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: isSelected ? darkColor : primaryColor,
            borderRadius: BorderRadius.circular(DeviceSize.ppi * 4)),
        padding: EdgeInsets.all(DeviceSize.ppi * 4),
        child:
            NormalText(widget.text, isSelected ? lightColor : darkColor, 1.5),
      ),
    );
  }
}
