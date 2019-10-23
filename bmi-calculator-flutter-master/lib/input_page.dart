import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const bottomBoxHeight = 80.0;
const boxBgColor = Color(0xFF1D1E33);
const bottomBoxBgColor = Color(0xFFEB1555);
const inActiveBoxColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleActiveColor = inActiveBoxColor;
  Color femaleActiveColor = inActiveBoxColor;

  void onPickGender(gender) {
    // 1: Male
    // 0: Female
    maleActiveColor = gender == 1 ? boxBgColor : inActiveBoxColor;
    femaleActiveColor = gender == 0 ? boxBgColor : inActiveBoxColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      onPickGender(1);
                    });
                  },
                  child: ReusableCard(
                    colour: maleActiveColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      onPickGender(0);
                    });
                  },
                  child: ReusableCard(
                    colour: femaleActiveColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: boxBgColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: ReusableCard(colour: boxBgColor),
              ),
              Expanded(
                child: ReusableCard(colour: boxBgColor),
              ),
            ]),
          ),
          Container(
            color: bottomBoxBgColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomBoxHeight,
          )
        ],
      ),
    );
  }
}
