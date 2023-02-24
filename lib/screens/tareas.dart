import 'package:flutter/material.dart';

class Tareas extends StatelessWidget {
  static final pageName= "tareas";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to chilipeppers',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: ListView(
          children: _crearTarea(),
        ),
      ),
    );
  }
  
  List<Widget> _crearTarea() {
    List<Widget> temp= [];
    for (var i = 0; i < 5; i++) {
      Widget item= ListTile(
        title: Text("Hola ${i+1}"),
      );
      temp.add(item);
    }
    return temp;
  }
}