import 'package:hive_flutter/hive_flutter.dart';

class Database {
  List todfyList = [];

  final _mybox = Hive.box("todo");

  // Method to load data from the Hive box
  void loadData() {
    // Assign a default empty list if "todfylist" key does not exist or is null
    todfyList = _mybox.get("todolist", defaultValue: []);
  }

  // Method to update the task list in the Hive box
  void updateTask() {
    _mybox.put("todolist", todfyList);
  }
}
