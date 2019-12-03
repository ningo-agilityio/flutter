import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  static const String id = 'add_task_screen';

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTask;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return Scaffold(
        body: Container(
          color: Color(0xff757575),
          child: Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Add Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {
                        newTask = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () {
                      taskData.addTask(newTask);
                      // Dismiss bottom sheet
                      Navigator.pop(context);
                    },
                  ),
                ],
              )),
        ),
      );
    });
  }
}
