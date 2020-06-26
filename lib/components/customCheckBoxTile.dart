import 'package:flutter/material.dart';
import 'package:thermo/components/texts.dart';
import 'package:thermo/const/colors.dart';

class CustomCheckBoxTile extends StatefulWidget {

  final String text;
  final IconData icon;
  final Function todo;

  CustomCheckBoxTile(this.text,this.icon,this.todo);

  @override
  _CustomCheckBoxTileState createState() => _CustomCheckBoxTileState();
}

class _CustomCheckBoxTileState extends State<CustomCheckBoxTile> {

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isSelected,
      title: NormalText(widget.text,lightColor,1.5),
      activeColor: primaryColor,
      checkColor: darkColor,
      secondary: Icon(widget.icon,color: lightColor,),
      onChanged: (val){
        setState(() {
          isSelected = val;
          widget.todo();
        });
      },
    );
  }
}
