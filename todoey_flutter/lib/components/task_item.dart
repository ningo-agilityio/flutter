import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String text;
  final bool value;
  final Function onChanged;
  final Function onRemove;

  TaskItem({this.text, this.value, this.onChanged, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        onRemove();
      },
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
