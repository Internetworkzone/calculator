import 'package:calc/modals/constants.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    @required this.hintText,
    @required this.onchanged,
    this.focusColor = white,
    this.hintColor = white,
    this.inputColor = black,
  });

  final onchanged;
  final String hintText;
  final Color hintColor;
  final Color focusColor;
  final Color inputColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            hintText,
            style: TextStyle(
              color: hintColor,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            style: TextStyle(
              color: inputColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: focusColor,
              filled: true,
            ),
            onChanged: onchanged,
          ),
        ],
      ),
    );
  }
}
