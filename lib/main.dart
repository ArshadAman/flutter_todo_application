import 'package:flutter/material.dart';
import 'package:todo_v1/pages/home_page.dart';
// ignore_for_file: prefer_const_constructors

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomePage(),
    );
  }
}