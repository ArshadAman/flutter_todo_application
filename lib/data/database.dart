import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [
  ];
  final _mybox = Hive.box('database');

  // Run this method if this is first time opening the app
  void createInitialData(){
    todoList = [["Make Tutorial", false], ["Do exercise", true]];
  }

  // Load data from the database
  void loadData(){
    todoList = _mybox.get("TODOLIST");
  }

  // Update the database
  void updateData(){
    _mybox.put("TODOLIST", todoList);
  }
}
