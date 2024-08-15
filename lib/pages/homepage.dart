import 'package:flutter/material.dart';
import 'package:todfy/pages/create_task.dart';
import 'package:todfy/services/database.dart';
import 'package:todfy/utils/NoTask.dart';
import 'package:todfy/utils/todo_frame.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Database db = Database();
  var _mybox = Hive.box("todo");

  @override
  void initState() {
    super.initState();
    if (_mybox.isEmpty) {
      print("empty");
      db.todfyList = [];
    } else {
      db.loadData();
    }
  }

  final _controller = TextEditingController();

  void onChanged(bool? value, int index) {
    setState(() {
      db.todfyList[index][1] = !db.todfyList[index][1];
    });
    db.updateTask();
  }

  void onSave() {
    setState(() {
      db.todfyList.add([_controller.text, false]);
    });
    _controller.clear();
    db.updateTask();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return MyDialog(
          controller: _controller,
          onsave: onSave,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteFunction(int index) {
    setState(() {
      db.todfyList.removeAt(index);
    });
    db.updateTask();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "T O D O",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          toolbarHeight: 80,
          titleSpacing: 20,
        ),
        body: db.todfyList.isEmpty
            ? NoTask() // Show NoTask widget when there are no tasks
            : ListView.builder(
                itemCount: db.todfyList.length,
                itemBuilder: (context, index) {
                  return todfyFrame(
                    taskName: db.todfyList[index][0],
                    taskCompleted: db.todfyList[index][1],
                    onChanged: (value) => onChanged(value, index),
                    deleteFunction: (context) => deleteFunction(index),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
