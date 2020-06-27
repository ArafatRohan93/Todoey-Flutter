import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/Widgets/task_tile.dart';
import 'package:todoeyflutter/models/task_data.dart';


class TaskList extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkBoxCallback: (checkboxState){
                taskData.updateTask(task);
              },
            longPressCallback: (){
                taskData.deleteTask(task);
            },
          );
        },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
