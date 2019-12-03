import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String text;
  final bool value;
  final Function onChanged;

  TaskItem({this.text, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(decoration: value ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: value,
        activeColor: Colors.lightBlueAccent,
        onChanged: onChanged,
      ),
    );
  }
}
