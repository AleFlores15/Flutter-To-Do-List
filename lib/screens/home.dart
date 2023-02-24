import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/screens/tareas.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: Tareas.pageName,
      routes: {
        Tareas.pageName: ((BuildContext context)=>Tareas()),    
      },
      home: Tareas(),

    );
  }
}