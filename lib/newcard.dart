import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  NewCard({this.cardNumber, this.ontap, this.textColor});
  final String cardNumber;
  final ontap;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0,
        color: Color(0xff252525),
        colorBrightness: Brightness.dark,
        splashColor: Color(0xff545454),
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
