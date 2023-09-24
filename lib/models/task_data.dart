import 'package:flutter/material.dart';
import 'package:my_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _taskList = [
    Task(taskName: 'Buy Egg'),
    Task(taskName: 'Buy Milk'),
    Task(taskName: 'Buy Orange'),
  ];

  List<Task> get tasklist {
    return _taskList;
  }

  void addTask(String taskName) {
    _taskList.add(Task(taskName: taskName));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
