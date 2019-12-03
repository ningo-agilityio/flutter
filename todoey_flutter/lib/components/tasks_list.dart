import 'package:flutter/material.dart';
import 'task_item.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskItem(
            text: taskData.get()[index].text,
            value: taskData.get()[index].finished,
            onChanged: (value) {
              taskData.toggleFinish(index);
            },
          );
        },
        itemCount: taskData.tasksCount(),
      );
    });
  }
}
