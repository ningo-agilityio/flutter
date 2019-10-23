import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
);

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  IconContent({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: textStyle,
        )
      ],
    );
  }
}
