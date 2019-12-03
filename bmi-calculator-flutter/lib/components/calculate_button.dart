import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ResultButton extends StatelessWidget {
  final Function onTap;
  final String title;

  ResultButton({@required this.onTap, @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomBoxBgColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomBoxHeight,
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: kLargeTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
