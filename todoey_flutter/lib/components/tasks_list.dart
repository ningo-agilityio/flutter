import 'package:flutter/material.dart';
import 'task_item.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  TasksList({this.tasks});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskItem(
          text: widget.tasks[index].text,
          value: widget.tasks[index].finished,
          onChanged: (value) {
            setState(() {
              widget.tasks[index].toggleFinish();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
