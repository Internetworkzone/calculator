import 'package:calc/modals/constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    this.onpressed,
    this.buttonText,
    this.buttonTextColor = white,
  });

  final onpressed;
  final buttonText;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: MaterialButton(
        height: 50,
        minWidth: 1500,
        splashColor: Color(0x11ff99),
        clipBehavior: Clip.antiAlias,
        onPressed: onpressed,
        color: blue,
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttonTextColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
