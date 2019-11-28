import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final Function onChanged;
  final String hintText;
  final bool obscure;
  final TextInputType inputType;

  RoundTextField({this.onChanged, this.hintText, this.obscure, this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      textAlign: TextAlign.center,
      obscureText: obscure,
      onChanged: onChanged,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
