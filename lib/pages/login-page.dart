import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/service/auth.dart';

import '../service/auth.dart';
import 'home.dart';

final AuthService _auth = AuthService();



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
        body: Center(
          child: ElevatedButton(
            child: Text('Sign in anonymously'),
            onPressed: () async {
              User? user = await _auth.signInAnonymously();
              if (user != null) {
                Navigator.pushNamed(context, '/todo');

              } else {
                print("hello");
                // Show an error message
              }
            },
          ),
        ),
    );
  }
}


