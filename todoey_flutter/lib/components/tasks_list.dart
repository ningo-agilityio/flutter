import 'package:flutter/material.dart';
import 'task_item.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(text: 'Buy bread'),
    Task(text: 'Buy yogurt'),
    Task(text: 'Buy milk'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskItem(
          text: tasks[index].text,
          value: tasks[index].finished,
          onChanged: (value) {
            setState(() {
              tasks[index].toggleFinish();
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
