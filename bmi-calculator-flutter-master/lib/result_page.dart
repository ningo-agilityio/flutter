import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
      ),
      body: Container(
        child: RawMaterialButton(
          fillColor: Colors.white,
          constraints: BoxConstraints.tightFor(
            width: 56,
            height: 56,
          ),
          onPressed: () {
            Navigator.pop(context, '/');
          },
        ),
      ),
    );
  }
}
