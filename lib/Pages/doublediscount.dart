import 'package:calc/modals/constants.dart';
import 'package:calc/widgets/buttonwidget.dart';
import 'package:calc/widgets/dialogtext.dart';
import 'package:calc/widgets/dialogwidget.dart';
import 'package:calc/widgets/newappbar.dart';
import 'package:calc/widgets/textformwidget.dart';
import 'package:flutter/material.dart';

class DoubleDiscount extends StatefulWidget {
  @override
  _DoubleDiscountState createState() => _DoubleDiscountState();
}

class _DoubleDiscountState extends State<DoubleDiscount> {
  int price;
  int firstPercent;
  int secondPercent;
  int firstPrice;
  int secondPrice;
  int savedPrice;
  int darkMode = 1;
  Color primary = black;
  Color secondary = white;

  doubleDiscontCalculation() {
    setState(
      () {
        firstPrice = price - (price * firstPercent / 100).round();
        secondPrice = firstPrice - (firstPrice * secondPercent / 100).round();
        savedPrice = price - secondPrice;
      },
    );
    showResult();
  }

  showResult() {
    return showDialog(
      context: context,
      child: DialogWidget(
        columnWidget: Column(
          children: <Widget>[
            DialogText(
              text: 'Final price',
              dialogTextColor: blue,
            ),
            DialogText(
              text: '$secondPrice',
              dialogTextColor: white,
            ),
            DialogText(
              text: 'Saved Price',
              dialogTextColor: blue,
            ),
            DialogText(
              text: '$savedPrice',
              dialogTextColor: white,
            ),
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
      backgroundColor: primary,
      appBar: newAppbar(
        barColor: primary,
        itemColor: secondary,
        context: context,
        title: 'Double Discounter',
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
                  focusColor: secondary,
                  inputColor: primary,
                  hintText: 'Price',
                  onchanged: (value) {
                    price = int.parse(value);
                  },
                ),
                TextFormWidget(
                  hintColor: secondary,
                  focusColor: secondary,
                  inputColor: primary,
                  hintText: 'First Discount',
                  onchanged: (value) {
                    firstPercent = int.parse(value);
                  },
                ),
                TextFormWidget(
                  hintColor: secondary,
                  focusColor: secondary,
                  inputColor: primary,
                  hintText: 'Second Discount',
                  onchanged: (value) {
                    secondPercent = int.parse(value);
                  },
                ),
                ButtonWidget(
                  buttonTextColor: secondary,
                  buttonText: 'Calculate',
                  onpressed: () => doubleDiscontCalculation(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
