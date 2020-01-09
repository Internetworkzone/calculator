import 'package:calc/newcard.dart';
import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  NumberRow({
    this.ontap1,
    this.ontap2,
    this.ontap3,
    this.ontap4,
    this.textColor1,
    this.textColor2,
    this.textColor3,
    this.textColor4,
    this.symbol1,
    this.symbol2,
    this.symbol3,
    this.symbol4,
    this.keypadColor,
  });
  final ontap1;
  final ontap2;
  final ontap3;
  final ontap4;
  final Color textColor1;
  final Color textColor2;
  final Color textColor3;
  final Color textColor4;
  final String symbol1;
  final String symbol2;
  final String symbol3;
  final String symbol4;
  final Color keypadColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: NewCard(
            keypadColor: keypadColor,
            cardNumber: symbol1,
            ontap: ontap1,
            textColor: textColor1,
          ),
        ),
        Expanded(
          child: NewCard(
            keypadColor: keypadColor,
            cardNumber: symbol2,
            ontap: ontap2,
            textColor: textColor2,
          ),
        ),
        Expanded(
          child: NewCard(
            keypadColor: keypadColor,
            cardNumber: symbol3,
            ontap: ontap3,
            textColor: textColor3,
          ),
        ),
        Expanded(
          child: NewCard(
            keypadColor: keypadColor,
            cardNumber: symbol4,
            ontap: ontap4,
            textColor: textColor4,
          ),
        ),
      ],
    );
  }
}
