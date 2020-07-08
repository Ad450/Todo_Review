import 'package:completetodo/utils/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClass extends ChangeNotifier {
  DatabaseClass.private();
  static DatabaseClass instance = DatabaseClass.private();

  Future<Database> _database;

  Future<Database> get getDatabase async {
    if (_database != null) {
      return _database;
    } else {
      String path = await getDatabasesPath();
      return await openDatabase(
        join(path, 'taskDatabase.db'),
        version: 1,
        onCreate: (Database db, int version) {
          db.execute(
            'CREATE TABLE taskTable(id INT PRIMARY KEY , taskMessage TEXT, date TEXT)',
          );
        },
      );
    }
  }

  insert(Task task) async {
    Database db = await DatabaseClass.instance.getDatabase;
    db.insert('taskTable', task.toMap());
    notifyListeners();
  }

  Future<List<Task>> fromDb() async {
    Database db = await DatabaseClass.instance.getDatabase;
    List<Map<String, dynamic>> listFromDb = await db.query('taskTable');
    return listFromDb.map((e) => Task.fromMap(e)).toList();
  }
}
