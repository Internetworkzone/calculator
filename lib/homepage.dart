import 'package:calc/newcard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> num1List = [];
  List<int> num2List = [];
  String resultNumber = '0';
  int numOne;
  int numTwo;
  int addedNumber;
  int operate;
  String sign;
  String initialValue = '';
  int firstNumb;

  assignNumber(int numb) {
    setState(() {
      if (sign == null) {
        num1List.add(numb);
        numOne = int.parse(num1List.join());
        initialValue = '$numOne';
      } else if (sign != null) {
        num2List.add(numb);
        numTwo = int.parse(num2List.join());
        initialValue = '$numOne' + '$sign' + '$numTwo';
      }
    });
  }

  assignSign(String si) {
    setState(() {
      sign = si;
      initialValue = '$numOne' + '$sign';
    });
  }

  calculate() {
    if (numTwo == null) {
      setState(() {
        resultNumber = 'error';
      });
    } else {
      if (operate == 1) {
        addition();
      } else if (operate == 2) {
        subtraction();
      } else if (operate == 3) {
        multiplication();
      } else {
        division();
      }
    }
  }

  addition() {
    setState(() {
      addedNumber = numOne + numTwo;
      resultNumber = addedNumber.toString();
    });
  }

  subtraction() {
    setState(() {
      addedNumber = numOne - numTwo;
      resultNumber = addedNumber.toString();
    });
  }

  multiplication() {
    setState(() {
      addedNumber = numOne * numTwo;
      resultNumber = addedNumber.toString();
    });
  }

  division() {
    setState(() {
      double divNumber = numOne / numTwo;
      addedNumber = divNumber.round();
      resultNumber = addedNumber.toString();
    });
  }

  backspace() {
    if (num1List.length == 0) {
      clear();
    } else {
      setState(() {
        if (num2List.length == 0 && sign == null && num1List.length != 0) {
          if (num1List.length == 1) {
            num1List.clear();
            initialValue = '';
          } else {
            num1List.removeLast();
            numOne = int.parse(num1List.join());
            initialValue = '$numOne';
          }
          //
        } else if (sign != null &&
            num1List.length != 0 &&
            num2List.length == 0) {
          sign = null;
          initialValue = '$numOne';
          //
        } else if (num2List != null) {
          if (num2List.length == 1) {
            num2List.clear();
            initialValue = '$numOne' + '$sign';
          } else {
            num2List.removeLast();
            numTwo = int.parse(num2List.join());
            initialValue = '$numOne' + '$sign' + '$numTwo';
          }
        }
      });
    }
  }

  clear() {
    setState(() {
      initialValue = '';
      resultNumber = '';
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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        initialValue,
                        style: TextStyle(
                          fontSize: initialValue.length > 15 ? 30 : 40,
                        ),
                      ),
                      Text(
                        resultNumber,
                        style: TextStyle(
                          fontSize: resultNumber.length > 12 ? 35 : 50,
                          fontWeight: FontWeight.bold,
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
            child: Container(
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          NewCard(
                            cardNumber: '7',
                            ontap: () => assignNumber(7),
                          ),
                          NewCard(
                            cardNumber: '8',
                            ontap: () => assignNumber(8),
                          ),
                          NewCard(
                            cardNumber: '9',
                            ontap: () => assignNumber(9),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          NewCard(
                            cardNumber: '4',
                            ontap: () => assignNumber(4),
                          ),
                          NewCard(
                            cardNumber: '5',
                            ontap: () => assignNumber(5),
                          ),
                          NewCard(
                            cardNumber: '6',
                            ontap: () => assignNumber(6),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          NewCard(
                            cardNumber: '1',
                            ontap: () => assignNumber(1),
                          ),
                          NewCard(
                            cardNumber: '2',
                            ontap: () => assignNumber(2),
                          ),
                          NewCard(
                            cardNumber: '3',
                            ontap: () => assignNumber(3),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          NewCard(
                            cardNumber: '. ',
                          ),
                          NewCard(
                            cardNumber: '0',
                            ontap: () => assignNumber(0),
                          ),
                          NewCard(
                            cardNumber: '=',
                            ontap: () => calculate(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      NewCard(
                        cardNumber: '÷',
                        ontap: () {
                          setState(() {
                            assignSign('÷');
                            operate = 4;
                          });
                        },
                      ),
                      NewCard(
                        cardNumber: 'x',
                        ontap: () {
                          setState(() {
                            assignSign('x');
                            operate = 3;
                          });
                        },
                      ),
                      NewCard(
                        cardNumber: '-',
                        ontap: () {
                          setState(() {
                            assignSign('-');
                            operate = 2;
                          });
                        },
                      ),
                      NewCard(
                          cardNumber: '+',
                          ontap: () {
                            setState(() {
                              assignSign('+');
                              operate = 1;
                            });
                          }),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      NewCard(
                        cardNumber: 'Back',
                        ontap: () => backspace(),
                      ),
                      NewCard(
                        cardNumber: 'Clear',
                        ontap: () => clear(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
