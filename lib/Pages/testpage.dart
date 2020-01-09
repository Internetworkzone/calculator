import 'package:calc/modals/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: green,
      appBar: AppBar(
        title: Text('Testing'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: blue,
            ),
          ),
          Expanded(
            child: Container(
              color: green,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 400,
                          child: Text('fhfh'),
                          color: white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 200,
                          child: Text('fhfh'),
                          color: black,
                        ),
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
