import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todo/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/addTask.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              title: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback: (bool newValue) {
                Provider.of<TaskData>(context)
                    .toggleDone(taskData.tasks[index]);
              },
              deleteTask: () {
                Provider.of<TaskData>(context).deleteTask(index);
              },
              editTask: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => AddTaskScreen(
                    task: taskData.tasks[index],
                  ),
                );
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
