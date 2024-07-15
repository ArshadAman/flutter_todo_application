// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_v1/components/button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(height: 120,
      child: Column(children: [
        TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Add new tasks',
          border: InputBorder.none
        ),
      ),
      Row(
        // Save button
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Button(text: "Save", onPressed: onSave),
          const SizedBox(width: 8,),
          Button(text: "Cancel", onPressed: onCancel),
        ],
        // Cancel Button
      )
      ],)
      ),
      backgroundColor: Colors.yellow[300],
    );
  }
}