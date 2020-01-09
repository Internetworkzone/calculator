import 'package:calc/Pages/calculator.dart';
import 'package:calc/Pages/discountcalc.dart';
import 'package:calc/Pages/doublediscount.dart';
import 'package:calc/Pages/percentagefind.dart';
import 'package:calc/Pages/testpage.dart';
import 'package:calc/modals/constants.dart';
import 'package:calc/widgets/backscreenwidget.dart';
import 'package:flutter/material.dart';

class BackgroundPage extends StatefulWidget {
  BackgroundPage({this.darkMode});
  final int darkMode;
  @override
  _BackgroundPageState createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.darkMode == 0 ? lightGrey : black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(width: 10),
                BackScreen(
                  screenName: 'Calculator',
                  imageUrl: 'asset/calc.png',
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Calculator(),
                      ),
                    );
                  },
                  darkMode: widget.darkMode,
                ),
                BackScreen(
                  screenName: 'Percentage Finder',
                  imageUrl: 'asset/percent.png',
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PercentageFinder(),
                      ),
                    );
                  },
                  darkMode: widget.darkMode,
                ),
                BackScreen(
                  screenName: 'Discount Calculator',
                  imageUrl: 'asset/discount1.png',
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DiscountCalculator(),
                      ),
                    );
                  },
                  darkMode: widget.darkMode,
                ),
                BackScreen(
                  screenName: 'Double Discounter',
                  imageUrl: 'asset/discount2.png',
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DoubleDiscount(),
                      ),
                    );
                  },
                  darkMode: widget.darkMode,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: FloatingActionButton(
              backgroundColor:
                  widget.darkMode == 0 ? Color(0xff1565c0) : Color(0xff1de9b6),
              child: Icon(
                Icons.close,
                color: Color(0xff111111),
                size: 40,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
