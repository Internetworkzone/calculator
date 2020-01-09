import 'package:calc/modals/constants.dart';
import 'package:calc/widgets/buttonwidget.dart';
import 'package:calc/widgets/dialogtext.dart';
import 'package:calc/widgets/dialogwidget.dart';
import 'package:calc/widgets/newappbar.dart';
import 'package:calc/widgets/textformwidget.dart';
import 'package:flutter/material.dart';

class DiscountCalculator extends StatefulWidget {
  @override
  _DiscountCalculatorState createState() => _DiscountCalculatorState();
}

class _DiscountCalculatorState extends State<DiscountCalculator> {
  int mainPrice;
  int discountPrice;
  double finalPrice;
  double savedPrice;
  int darkMode = 1;
  Color primary = black;
  Color secondary = white;

  discountCalculation() {
    setState(() {
      finalPrice = mainPrice - (mainPrice * discountPrice / 100);
      savedPrice = mainPrice - finalPrice;
    });
    resultDialog();
  }

  resultDialog() {
    return showDialog(
      context: context,
      child: DialogWidget(
        columnWidget: Column(
          children: <Widget>[
            DialogText(text: 'Final Price', dialogTextColor: blue),
            DialogText(text: '$finalPrice', dialogTextColor: white),
            DialogText(text: 'Saved Price', dialogTextColor: blue),
            DialogText(text: '$savedPrice', dialogTextColor: white),
          ],
        ),
      ),
    );
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
      backgroundColor: darkMode == 1 ? black : white,
      appBar: newAppbar(
        context: context,
        title: 'Discount Calculator',
        barColor: primary,
        itemColor: secondary,
        onpressed: () => setDarkMode(),
        mode: darkMode,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormWidget(
                  hintColor: secondary,
                  inputColor: primary,
                  focusColor: secondary,
                  hintText: 'Price Before Discount',
                  onchanged: (value) {
                    mainPrice = int.parse(value);
                  },
                ),
                TextFormWidget(
                  hintColor: secondary,
                  inputColor: primary,
                  focusColor: secondary,
                  hintText: 'Discount %',
                  onchanged: (value) {
                    discountPrice = int.parse(value);
                  },
                ),
                ButtonWidget(
                  buttonTextColor: secondary,
                  buttonText: 'Calculate',
                  onpressed: () {
                    discountCalculation();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
