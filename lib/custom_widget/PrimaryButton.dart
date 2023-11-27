import 'package:flutter/material.dart';
import 'package:otms/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const PrimaryButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      color: defaultAccentColor,
      elevation: 0,
      height: 48,
      splashColor: Colors.white.withAlpha(30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Text(buttonText,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          )),
    );
  }
}
