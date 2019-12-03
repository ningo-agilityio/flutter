import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(text: 'Buy bread'),
    Task(text: 'Buy yogurt'),
    Task(text: 'Buy milk'),
  ];

  List<Task> get() {
    return _tasks;
  }

  void addTask(value) {
    _tasks.add(Task(text: value));
    notifyListeners();
  }

  void deleteTask(index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleFinish(index) {
    _tasks[index].finished = !_tasks[index].finished;
    notifyListeners();
  }

  int tasksCount() {
    return _tasks.length;
  }
}
