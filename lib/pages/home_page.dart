// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_v1/components/dialog_box.dart';
import 'package:todo_v1/components/todo_tile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  // List of todo tasks
  List todoList = [
    ["Make your bed", false],
    ["Make your meal", true],
    ["Study", false],
    ["Write some code", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(context: context, builder: (context){
      return DialogBox(

      );
    });
    // setState(() {
    //   todoList.add(["New Task", false]);
    // });
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
        itemCount: todoList.length,
        itemBuilder: (context, index){
          return TodoTile(
            taskname: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}