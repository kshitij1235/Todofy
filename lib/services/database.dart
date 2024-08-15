import 'package:hive_flutter/hive_flutter.dart';

class Database {
  List todfyList = [];

  final _mybox = Hive.box("todfy");

  // Method to load data from the Hive box
  void loadData() {
    // Assign a default empty list if "todfylist" key does not exist or is null
    todfyList = _mybox.get("todfylist", defaultValue: []);
  }

  // Method to update the task list in the Hive box
  void updateTask() {
    _mybox.put("todfylist", todfyList);
  }
}
