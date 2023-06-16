import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:mainproject/start.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Start(),
      ),
    );
  }
}
