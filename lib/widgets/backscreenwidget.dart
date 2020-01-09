import 'package:calc/modals/constants.dart';
import 'package:flutter/material.dart';

class BackScreen extends StatelessWidget {
  const BackScreen(
      {@required this.screenName, this.imageUrl, this.ontap, this.darkMode});

  final String screenName;
  final String imageUrl;
  final ontap;
  final int darkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 70,
      ),
      child: Column(
        children: <Widget>[
          Text(
            screenName,
            style: TextStyle(
              color: darkMode == 0 ? black : white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 450,
            width: 300,
            child: GestureDetector(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
              onTap: ontap,
            ),
          ),
        ],
      ),
    );
  }
}
