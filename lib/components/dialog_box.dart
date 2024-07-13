// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(height: 120,
      child: Column(children: [
        TextField(
        decoration: InputDecoration(
          hintText: 'Add new tasks',
          border: InputBorder.none
        ),
      ),
      Row(
        // Save button
        children: [
          Icon(Icons.save),
          Icon(Icons.cancel),
        ],
        // Cancel Button
      )
      ],)
      ),
      backgroundColor: Colors.yellow[300],
    );
  }
}