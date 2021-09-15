import 'package:flutter/material.dart';
import '../../constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(18),
          primary: primaryColor),
      child: CustomText(
        text: text,
        color: Colors.white,
        alignment: Alignment.center,
      ),
      onPressed: onPressed,
    );
  }
}
