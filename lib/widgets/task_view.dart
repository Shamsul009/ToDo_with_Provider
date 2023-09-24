import 'package:flutter/material.dart';
import 'package:my_app/models/task.dart';
import 'package:my_app/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key, required this.task});
  final Task task;
  
  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  bool checkboxState = false;
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            widget.task.taskName,
            style: TextStyle(
                color: widget.task.isDone == true ? Colors.red : Colors.black),
          ),
          trailing: Checkbox(
            value: widget.task.isDone,
            onChanged: (value) {
              Provider.of<TaskData>(context,listen: false).updateTask(widget.task);
            },
          ),
        )
      ],
    );
  }
}
