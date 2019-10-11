import 'package:flutter/material.dart';

// The main function is the starting point for all our Flutter apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: Text('I am poor'),
          backgroundColor: Colors.pink[900],
        ),
        body: Center(
          child: CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage('images/lotus.png'),
          ),
        ),
      ),
    ),
  );
}
