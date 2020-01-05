import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  NewCard({this.cardNumber, this.ontap});
  final String cardNumber;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            cardNumber,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      onTap: ontap,
    );
  }
}
