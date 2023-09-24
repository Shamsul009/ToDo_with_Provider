import 'package:flutter/material.dart';
import 'package:my_app/models/task_data.dart';
import 'package:my_app/widgets/task_view.dart';
import 'package:provider/provider.dart';

class AddTaskModel extends StatefulWidget {
  // const AddTaskModel({
  //   Key? key,
  //   required this.addTaskCallback, // Add a callback to add tasks
  // }) : super(key: key);

  // final Function addTaskCallback;

  @override
  State<AddTaskModel> createState() => _AddTaskModelState();
}

class _AddTaskModelState extends State<AddTaskModel> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _addTaskController = TextEditingController();

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Add Tasks'),
              TextField(
                autofocus: true,
                controller: _addTaskController,
              ),
              ElevatedButton(
                  onPressed: () {
                    String addTask = _addTaskController.text.toString();
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(addTask);
                    // widget.addTaskCallback(addTask);
                  
                    _addTaskController.clear();
                  },
                  child: Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}
