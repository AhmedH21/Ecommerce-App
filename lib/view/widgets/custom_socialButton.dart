import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPress;

   CustomSocialButton({this.text, this.imageName, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(12),
        color: Colors.grey.shade100
      ),
      child: TextButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
        onPressed: onPress,
        child: Row(
          children: [
            Image.asset(imageName),
            SizedBox(
              width: 90,
            ),
            CustomText(
              text: text,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
