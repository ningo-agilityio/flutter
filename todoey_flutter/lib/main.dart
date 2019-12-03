import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'screens/tasks_screen.dart';
import 'screens/add_task_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
      child: MaterialApp(
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
      ),
    );
  }
}
