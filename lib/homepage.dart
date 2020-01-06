import 'dart:math';
import 'package:calc/number_row.dart';
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
        resultValue = divNumber.toString();
      } catch (e) {
        resultValue = "Can't divide by 0 ";
      }
    });
  }

  percentage() {
    setState(() {
      try {
        double percentNumber = numOne / 100 * numTwo;
        // calculatedValue = percentNumber.round();
        resultValue = percentNumber.toString();
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
                        Expanded(
                          child: NumberRow(
                            symbol1: 'C',
                            symbol2: '<-',
                            symbol3: '%',
                            symbol4: '^',
                            textColor1: Colors.red,
                            textColor2: Colors.orange,
                            textColor3: Color(0xff44aaee),
                            textColor4: Color(0xff44aaee),
                            ontap1: () => clear(),
                            ontap2: () => backspace(),
                            ontap3: () {
                              setState(() {
                                assignSign('%');
                                operaterSign = 5;
                              });
                            },
                            ontap4: () {
                              setState(() {
                                assignSign('^');
                                operaterSign = 6;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberRow(
                            symbol1: '7',
                            symbol2: '8',
                            symbol3: '9',
                            symbol4: '÷',
                            textColor1: Colors.white,
                            textColor2: Colors.white,
                            textColor3: Colors.white,
                            textColor4: Color(0xff44aaee),
                            ontap1: () => assignNumber(7),
                            ontap2: () => assignNumber(8),
                            ontap3: () => assignNumber(9),
                            ontap4: () {
                              setState(() {
                                assignSign('÷');
                                operaterSign = 4;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberRow(
                            symbol1: '4',
                            symbol2: '5',
                            symbol3: '6',
                            symbol4: 'x',
                            textColor1: Colors.white,
                            textColor2: Colors.white,
                            textColor3: Colors.white,
                            textColor4: Color(0xff44aaee),
                            ontap1: () => assignNumber(4),
                            ontap2: () => assignNumber(5),
                            ontap3: () => assignNumber(6),
                            ontap4: () {
                              setState(() {
                                assignSign('x');
                                operaterSign = 3;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: NumberRow(
                            symbol1: '1',
                            symbol2: '2',
                            symbol3: '3',
                            symbol4: '-',
                            textColor1: Colors.white,
                            textColor2: Colors.white,
                            textColor3: Colors.white,
                            textColor4: Color(0xff44aaee),
                            ontap1: () => assignNumber(1),
                            ontap2: () => assignNumber(2),
                            ontap3: () => assignNumber(3),
                            ontap4: () {
                              setState(() {
                                assignSign('-');
                                operaterSign = 2;
                              });
                            },
                          ),
                        ),
                        Expanded(
                            child: NumberRow(
                          symbol1: '.',
                          symbol2: '0',
                          symbol3: '=',
                          symbol4: '+',
                          textColor1: Colors.white,
                          textColor2: Colors.white,
                          textColor3: Color(0xff44aaee),
                          textColor4: Color(0xff44aaee),
                          ontap1: () {},
                          ontap2: () => assignNumber(0),
                          ontap3: () => calculate(),
                          ontap4: () {
                            setState(() {
                              assignSign('+');
                              operaterSign = 1;
                            });
                          },
                        )),
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
