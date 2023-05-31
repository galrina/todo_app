import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
        title: Text('To-Do List'),
    centerTitle: true,
    ),
    body: Column(
      children: [
        ElevatedButton(onPressed: () {
          Navigator.pushReplacementNamed(context, '/todo');
          
        }, child: Text('Login'))
      ],
    ) 
    );
  }
}
