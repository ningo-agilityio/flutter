import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../components/reusable_card.dart';
import '../components/calculate_button.dart';
import 'package:bmi_calculator/utils/calculator_brain.dart';

class ResultPage extends StatelessWidget {
  final String bmiResultNumber;
  final BMIResult bmiResultMsg;

  ResultPage({@required this.bmiResultNumber, @required this.bmiResultMsg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your result',
                style: kTitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActionButtonBgColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResultMsg.message,
                    style: bmiResultMsg.message == 'Normal'
                        ? kResultTextStyle
                        : kResultNotNormalTextStyle,
                  ),
                  Text(bmiResultNumber, style: kBMITextStyle),
                  Text(
                    bmiResultMsg.interpretation,
                    style: kBMIBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          ResultButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
