import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskname,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction, icon: Icons.delete, backgroundColor: Colors.red.shade300,)
          ],
        ),
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
      ),
    );
  }
}
