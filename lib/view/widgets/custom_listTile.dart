import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final Function onPressed;
  final String imagePath;
  final String text;
  final IconData icon;

  const CustomListTile({this.onPressed, this.imagePath, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: ListTile(
          leading: Image.asset(imagePath),
          title: CustomText(
            text: text,
          ),
          trailing: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}