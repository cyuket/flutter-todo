import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Task task;

  AddTaskScreen({this.task});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                task.name == null ? 'Add Task' : "Edit Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign:
                    task.name == null ? TextAlign.center : TextAlign.left,
                controller: TextEditingController(
                    text: task.name == null ? '' : task.name),
                onChanged: (newValue) {
                  newTaskTitle = newValue;
                },
                onSubmitted: (newValue) {
                  newTaskTitle = newValue;
                  if (task == null) {
                    Provider.of<TaskData>(context).addTask(newTaskTitle);
                  } else {
                    Provider.of<TaskData>(context).editTask(task, newTaskTitle);
                  }

                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () {
                  if (task == null) {
                    Provider.of<TaskData>(context).addTask(newTaskTitle);
                  } else {
                    Provider.of<TaskData>(context).editTask(task, newTaskTitle);
                  }

                  Navigator.pop(context);
                },
                child: Text(
                  task.name == "" ? 'Add' : "Edit",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
