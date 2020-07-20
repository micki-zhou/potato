import 'package:flutter/material.dart';
import 'package:potato/ui/login.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'potato',
      home: LoginPage(),
    );
  }
}