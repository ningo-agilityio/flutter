import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  static const String id = 'add_task_screen';
  final Function onAddNew;

  AddTaskScreen({this.onAddNew});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTask;

  @override
  Widget build(BuildContext context) {
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
                    widget.onAddNew(newTask);
                  },
                ),
              ],
            )),
      ),
    );
  }
}
