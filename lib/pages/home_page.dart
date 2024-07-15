// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_v1/components/dialog_box.dart';
import 'package:todo_v1/components/todo_tile.dart';
import 'package:todo_v1/data/database.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final _mybox = Hive.box('database');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // if this is first time opening the app then create data
    if(_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    }else{
      // there already exists the data
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();
  void saveNewTask(){
    setState(() {
       db.todoList.add([_controller.text, false]);
       _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  // List of todo tasks

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void createNewTask() {
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    });
    db.updateData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text("Task List"),),
        elevation: 0,
        backgroundColor: Colors.yellow[300],
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index){
          return TodoTile(
            taskname: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context)=> deleteTask(index),
          );
        },
      ),
    );
  }
}