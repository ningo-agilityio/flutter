import 'package:flutter/material.dart';

// The main function is the starting point for all our Flutter apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
         drawer: Drawer(child:UserAccountsDrawerHeader(accountName: Text('xyz'),arrowColor: Colors.black,currentAccountPicture: CircleAvatar(child: Text('V'),),),),
        
        backgroundColor: Colors.black[100],
        appBar: AppBar(
          title: Text('I am rich', style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.black[900],
        ),
        body: Center(
          child: CircleAvatar(
            radius: 140,
            backgroundImage: AssetImage('images/lotus.png'),
          ),
        ),
      ),
    ),
  );
}
