import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(text: 'Buy bread'),
    Task(text: 'Buy yogurt'),
    Task(text: 'Buy milk'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(value) {
    _tasks.add(Task(text: value));
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleFinish(index) {
    _tasks[index].toggleFinish();
    notifyListeners();
  }

  int tasksCount() {
    return _tasks.length;
  }
}
