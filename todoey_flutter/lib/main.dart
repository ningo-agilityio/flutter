import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'screens/add_task_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: TasksScreen.id,
      home: TasksScreen(),
      routes: {
        AddTaskScreen.id: (context) => AddTaskScreen(),
        TasksScreen.id: (context) => TasksScreen(),
      },
    );
  }
}
