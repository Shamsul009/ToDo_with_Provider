import 'package:flutter/material.dart';
import 'package:my_app/models/task_data.dart';
import 'package:provider/provider.dart';
import '../widgets/task_view.dart';
import '../widgets/add_task_model.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({
    super.key,
  });

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // final TextEditingController _addTaskController = TextEditingController();
  //List<String> tasks = ['LearnFlutter', 'LearnJava'];

  // void addTask(String task) {
  //   setState(() {
  //     tasks.add(task);
  //     Navigator.pop(context);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskModel());
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 60,
              bottom: 30,
              right: 30,
              left: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: const AssetImage('images/jerry.png'),
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  'Jerry',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.0),
                ),
                Text('jerry@gmail.com',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.0)),
                SizedBox(
                  height: 24,
                ),
                Text('My Task',
                    style: TextStyle(color: Colors.white, fontSize: 32.0)),
                Text('${Provider.of<TaskData>(context).tasklist.length} Tasks',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.0)),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: ListView.builder(
                    itemCount: Provider.of<TaskData>(context).tasklist.length,
                    itemBuilder: (context, index) {
                     
                      final task =
                          Provider.of<TaskData>(context).tasklist[index];
                      return TaskListView(task:task);
                    },
                  ))),
        ],
      ),
    );
  }
}
