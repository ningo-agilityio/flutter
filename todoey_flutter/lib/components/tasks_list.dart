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
            text: taskData.tasks[index].text,
            value: taskData.tasks[index].finished,
            onChanged: (value) {
              taskData.toggleFinish(index);
            },
            onRemove: () {
              taskData.deleteTask(taskData.tasks[index]);
            },
          );
        },
        itemCount: taskData.tasksCount(),
      );
    });
  }
}
