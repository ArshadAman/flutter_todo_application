import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_v1/pages/home_page.dart';
// ignore_for_file: prefer_const_constructors

void main() async{

  // initialize hive
  await Hive.initFlutter();
  var box = await Hive.openBox('database');
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