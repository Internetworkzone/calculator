import 'dart:math';

import 'package:calc/newcard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> num1List = [];
  List<int> num2List = [];
  String resultValue = '0';
  int numOne;
  int numTwo;
  int calculatedValue;
  int operaterSign;
  String sign;
  String inputValue = '';
  List<String> inputList = [];

  assignNumber(int numb) {
    setState(() {
      if (calculatedValue != null) {
        numOne = calculatedValue;
        num2List.add(numb);
        numTwo = int.parse(num2List.join());
        inputValue = '$numOne' + '$sign' + '$numTwo';
      } else {
        if (sign == null) {
          num1List.add(numb);
          numOne = int.parse(num1List.join());
          inputValue = '$numOne';
        } else if (sign != null) {
          num2List.add(numb);
          numTwo = int.parse(num2List.join());
          inputValue = '$numOne' + '$sign' + '$numTwo';
        }
      }
    });
  }

  assignSign(String si) {
    setState(() {
      if (calculatedValue != null) {
        calculate();
        numOne = calculatedValue;
        num2List.clear();
        sign = si;
        inputValue = '$numOne' + '$sign';
        calculatedValue = null;
      } else if (numOne != null && numTwo != null) {
        calculate();
        numOne = calculatedValue;
        num2List.clear();
        sign = si;
        inputValue = '';
        calculatedValue = null;
        numTwo = null;
      } else if (numOne == null) {
        numOne = 0;
        sign = null;
      } else {
        sign = si;

        inputValue = '$numOne' + '$sign';
      }
    });
  }

  calculate() {
    setState(() {
      if (numTwo == null && numOne == null) {
        resultValue = '$numOne';
      } else {
        if (operaterSign == 1) {
          addition();
        } else if (operaterSign == 2) {
          subtraction();
        } else if (operaterSign == 3) {
          multiplication();
        } else if (operaterSign == 4) {
          division();
        } else if (operaterSign == 5) {
          percentage();
        } else if (operaterSign == 6) {
          exponential();
        }
      }
    });
  }

  addition() {
    try {
      setState(() {
        calculatedValue = numOne + numTwo;
        resultValue = calculatedValue.toString();
      });
    } catch (e) {
      resultValue = 'error';
    }
  }

  subtraction() {
    try {
      setState(() {
        calculatedValue = numOne - numTwo;
        resultValue = calculatedValue.toString();
      });
    } catch (e) {
      resultValue = 'error';
    }
  }

  multiplication() {
    try {
      setState(() {
        calculatedValue = numOne * numTwo;
        resultValue = calculatedValue.toString();
      });
    } catch (e) {
      resultValue = 'error';
    }
  }

  division() {
    setState(() {
      try {
        double divNumber = numOne / numTwo;
        calculatedValue = divNumber.round();
        resultValue = calculatedValue.toString();
      } catch (e) {
        resultValue = "Can't divide by 0 ";
      }
    });
  }

  percentage() {
    setState(() {
      try {
        double percentNumber = numOne / 100 * numTwo;
        calculatedValue = percentNumber.round();
        resultValue = calculatedValue.toString();
      } catch (e) {
        resultValue = "Can't divide by 0 ";
      }
    });
  }

  exponential() {
    setState(() {
      try {
        // double expoNumber = pow(numOne, numTwo);
        calculatedValue = pow(numOne, numTwo);
        resultValue = calculatedValue.toString();
      } catch (e) {
        resultValue = "Can't divide by 0 ";
      }
    });
  }

  backspace() {
    if (num1List.length == 0) {
      clear();
    } else {
      setState(() {
        if (num2List.length == 0 && sign == null && num1List.length != 0) {
          if (num1List.length == 1) {
            inputValue = '';
            resultValue = '';
          } else {
            num1List.removeLast();
            numOne = int.parse(num1List.join());
            inputValue = '$numOne';
          }
          //
        } else if (sign != null &&
            num1List.length != 0 &&
            num2List.length == 0) {
          sign = null;
          inputValue = '$numOne';
          //
        } else if (num2List != null) {
          if (num2List.length == 1) {
            num2List.clear();
            inputValue = '$numOne' + '$sign';
          } else {
            num2List.removeLast();
            numTwo = int.parse(num2List.join());
            inputValue = '$numOne' + '$sign' + '$numTwo';
          }
        }
      });
    }
  }

  clear() {
    setState(() {
      calculatedValue = null;
      inputValue = '';
      resultValue = '';
      numOne = null;
      numTwo = null;
      sign = null;
      num1List.clear();
      num2List.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff252525),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xff111111),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          inputValue,
                          style: TextStyle(
                            fontSize: inputValue.length > 15 ? 30 : 40,
                            color: Color(0xff44aaee),
                          ),
                        ),
                        Text(
                          resultValue,
                          style: TextStyle(
                            fontSize: resultValue.length > 12 ? 35 : 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: NewCard(
                                cardNumber: 'C',
                                ontap: () => clear(),
                                textColor: Colors.red,
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '<-',
                                ontap: () => backspace(),
                                textColor: Colors.orange,
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '%',
                                ontap: () {
                                  setState(() {
                                    assignSign('%');
                                    operaterSign = 5;
                                  });
                                },
                                textColor: Color(0xff44aaee),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '^',
                                ontap: () {
                                  setState(() {
                                    assignSign('^');
                                    operaterSign = 6;
                                  });
                                },
                                textColor: Color(0xff44aaee),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: NewCard(
                                cardNumber: '7',
                                ontap: () => assignNumber(7),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '8',
                                ontap: () => assignNumber(8),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '9',
                                ontap: () => assignNumber(9),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '÷',
                                ontap: () {
                                  setState(() {
                                    assignSign('÷');
                                    operaterSign = 4;
                                  });
                                },
                                textColor: Color(0xff44aaee),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: NewCard(
                                cardNumber: '4',
                                ontap: () => assignNumber(4),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '5',
                                ontap: () => assignNumber(5),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '6',
                                ontap: () => assignNumber(6),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: 'x',
                                ontap: () {
                                  setState(() {
                                    assignSign('x');
                                    operaterSign = 3;
                                  });
                                },
                                textColor: Color(0xff44aaee),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: NewCard(
                                cardNumber: '1',
                                ontap: () => assignNumber(1),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '2',
                                ontap: () => assignNumber(2),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '3',
                                ontap: () => assignNumber(3),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '-',
                                ontap: () {
                                  setState(() {
                                    assignSign('-');
                                    operaterSign = 2;
                                  });
                                },
                                textColor: Color(0xff44aaee),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: NewCard(
                                cardNumber: '.',
                                ontap: () {},
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '0',
                                ontap: () => assignNumber(0),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '=',
                                ontap: () => calculate(),
                                textColor: Color(0xff44aaee),
                              ),
                            ),
                            Expanded(
                              child: NewCard(
                                cardNumber: '+',
                                ontap: () {
                                  setState(() {
                                    assignSign('+');
                                    operaterSign = 1;
                                  });
                                },
                                textColor: Color(0xff44aaee),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
