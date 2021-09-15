import 'package:e_commerceapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String text;
  final String hint;
  final Function onSave;
  final Function validator;

  CustomTextForm({this.text, this.hint, this.onSave, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CustomText(
          text: text,
          alignment: Alignment.topLeft,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          onSaved: onSave,
          validator: validator,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white),
        )
      ],
    ),);
  }
}
