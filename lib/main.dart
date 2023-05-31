import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/pages/login-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/todo': (context) => Home(),
    },
  ));
}