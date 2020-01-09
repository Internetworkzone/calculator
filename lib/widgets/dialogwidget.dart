import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({@required this.columnWidget});

  final Widget columnWidget;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Color(0xff111111),
      children: <Widget>[
        Center(
          child: columnWidget,
        ),
      ],
    );
  }
}
