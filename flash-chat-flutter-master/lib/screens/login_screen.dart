import 'package:flutter/material.dart';
import 'package:flash_chat/components/round_button.dart';
import 'package:flash_chat/components/text_box.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextBox(
              hintText: 'Enter your email',
              onChanged: () {},
            ),
            SizedBox(
              height: 8.0,
            ),
            TextBox(
              hintText: 'Enter your password.',
              onChanged: () {},
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundButton(
              text: 'Log In',
              bgColor: Colors.lightBlueAccent,
              onPressed: () {
                //Implement login functionality.
              },
            ),
          ],
        ),
      ),
    );
  }
}
