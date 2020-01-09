import 'package:calc/backroundpage.dart';
import 'package:calc/modals/constants.dart';
import 'package:flutter/material.dart';

Widget newAppbar(
    {BuildContext context,
    Color barColor = black,
    Color itemColor = white,
    String title,
    int mode,
    onpressed}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: itemColor),
    ),
    backgroundColor: barColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: itemColor,
        size: 30,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BackgroundPage(
              darkMode: mode,
            ),
          ),
        );
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.lightbulb_outline,
          size: 30,
          color: itemColor,
        ),
        onPressed: onpressed,
      ),
    ],
  );
}
