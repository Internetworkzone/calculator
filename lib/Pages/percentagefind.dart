import 'package:calc/modals/constants.dart';
import 'package:calc/widgets/buttonwidget.dart';
import 'package:calc/widgets/dialogtext.dart';
import 'package:calc/widgets/dialogwidget.dart';
import 'package:calc/widgets/newappbar.dart';
import 'package:calc/widgets/textformwidget.dart';
import 'package:flutter/material.dart';

class PercentageFinder extends StatefulWidget {
  @override
  _PercentageFinderState createState() => _PercentageFinderState();
}

class _PercentageFinderState extends State<PercentageFinder> {
  int actualPrice;
  int discountPrice;
  double discountPercent;
  int result;
  int darkMode = 1;
  Color primary = black;
  Color secondary = white;

  percentageCalculation() {
    setState(() {
      discountPercent = 100 / actualPrice * discountPrice;
      result = discountPercent.round();
    });

    showResult();
  }

  showResult() {
    return showDialog(
        context: context,
        child: DialogWidget(
          columnWidget: Column(
            children: <Widget>[
              DialogText(
                text: 'Discount Percentage',
                dialogTextColor: blue,
              ),
              DialogText(
                text: '$result %',
                dialogTextColor: white,
              ),
            ],
          ),
        ));
  }

  setDarkMode() {
    setState(() {
      darkMode = darkMode == 1 ? 0 : 1;
      primary = darkMode == 1 ? black : white;
      secondary = darkMode == 1 ? white : black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: newAppbar(
        barColor: primary,
        itemColor: secondary,
        context: context,
        title: 'Percentage Finder',
        onpressed: () => setDarkMode(),
        mode: darkMode,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormWidget(
                focusColor: secondary,
                hintColor: secondary,
                inputColor: primary,
                hintText: 'Actual Price',
                onchanged: (value) {
                  actualPrice = int.parse(value);
                },
              ),
              TextFormWidget(
                focusColor: secondary,
                hintColor: secondary,
                inputColor: primary,
                hintText: 'Discount Price',
                onchanged: (value) {
                  discountPrice = int.parse(value);
                },
              ),
              ButtonWidget(
                buttonTextColor: secondary,
                buttonText: 'Calculate',
                onpressed: () {
                  percentageCalculation();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
