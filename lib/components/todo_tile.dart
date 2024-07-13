import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  TodoTile({
    super.key,
    required this.taskname,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10),
              color: Colors.yellow),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              // checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.black,),

              // Text
              Text(taskname, style: TextStyle(decoration: taskCompleted? TextDecoration.lineThrough: TextDecoration.none),),
            ],
          )),
    );
  }
}
