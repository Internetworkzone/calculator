import 'package:calc/modals/constants.dart';
import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  NewCard({
    this.cardNumber,
    this.ontap,
    this.textColor,
    this.keypadColor = primaryKeypad,
    this.fontsize = 30,
  });
  final String cardNumber;
  final ontap;
  final Color textColor;
  final Color keypadColor;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0,
        color: keypadColor,
        colorBrightness: Brightness.dark,
        splashColor: keypadColor,
        textColor: textColor,
        onPressed: ontap,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Text(
            cardNumber,
            style: TextStyle(fontSize: 30),
          ),
        ));
  }
}
