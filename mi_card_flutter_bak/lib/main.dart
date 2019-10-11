import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var donuts = 0;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: AppBar(
          backgroundColor: Colors.pink[500],
          title: Text('Mi Card'),
        ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 100,
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Center(
                  child: Text('Container 1'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 120,
                    padding: EdgeInsets.all(20),
                    color: Colors.pink[100],
                    child: Center(
                      child: Text('Container 2a'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: 120,
                    padding: EdgeInsets.all(20),
                    color: Colors.pink[100],
                    child: Center(
                      child: Text('Container 2b'),
                    ),
                  ),
                ],
              ),
              Container(
                width: 100,
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Center(
                  child: Text('Container 3'),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink[300],
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
