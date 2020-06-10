import 'package:flutter/material.dart';
import 'package:thermo/const/colors.dart';
import 'package:thermo/const/sizes.dart';

class NormalText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  NormalText(this.text, this.color,this.size);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Comforta',
        fontSize: DeviceSize.size.width/40 * size,
        color: color
      ),
    );
  }
}

class StampText extends StatelessWidget {

  final String type;
  StampText(this.type);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: darkColor,
      child: Padding(
        padding: EdgeInsets.all(DeviceSize.ppi),
        child: RichText(
          text: TextSpan(text: type,style: TextStyle(fontFamily: 'Comforta',fontSize: DeviceSize.ppi*5,color: lightColor)),
        ),
      ),
    );
  }
}
