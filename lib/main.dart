import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/main-screen.dart';



void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.orange,
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (contect) => Home(),
  },
));

