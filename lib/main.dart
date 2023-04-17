import 'package:flutter/material.dart';
import './screens/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0Xff00B0FF)
      ),
      home: LoginScreen(),

    );
  }
}

