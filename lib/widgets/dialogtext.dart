import 'package:flutter/material.dart';

class DialogText extends StatelessWidget {
  const DialogText({this.text, this.size = 30, this.dialogTextColor});

  final String text;
  final double size;
  final Color dialogTextColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          color: dialogTextColor,
          fontSize: size,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
