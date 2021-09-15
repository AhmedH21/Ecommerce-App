import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double spaceLine;
  final FontWeight fontWeight;

  CustomText(
      {this.text, this.fontSize, this.color, this.alignment, this.spaceLine,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(fontWeight:fontWeight ,color: color, fontSize: fontSize, height: spaceLine),
      ),
    );
  }
}
