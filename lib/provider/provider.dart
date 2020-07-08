import 'package:completetodo/database/database.dart';
import 'package:completetodo/utils/task.dart';
import 'package:flutter/cupertino.dart';

class TaskProvider extends ChangeNotifier {
  // tried to collect store list from database in a custom list
  List<Task> taskList = List();

  addTask(Task task) async {
    await DatabaseClass.instance.insert(task);
    notifyListeners();
  }
}
