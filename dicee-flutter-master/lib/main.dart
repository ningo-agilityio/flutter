import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 5;

  void randomDice() {
    leftDice = Random().nextInt(6) + 1; // 1 - 6
    rightDice = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  child: Image.asset('images/dice$leftDice.png'),
                  onPressed: () {
                    setState(() {
                      randomDice();
                    });
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Image.asset('images/dice$rightDice.png'),
                  onPressed: () {
                    setState(() {
                      randomDice();
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
