

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/home.dart';

void main(){

  runApp(const MyApp());

}
    class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}