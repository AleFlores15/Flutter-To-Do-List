import 'package:flutter/material.dart';

class Tareas extends StatelessWidget {
  static final pageName= "tareas";
  static final List<Map<String,dynamic>> tareas =[
    {
      'Nombre': 'Pedro',
      'Descripcion':'Tarea Flutter',
      'Fecha':'12/12/12',
      'Estado':false
    },
    {
      'Nombre': 'Pedro',
      'Descripcion':'Tarea Flutter',
      'Fecha':'12/12/12',
      'Estado':true
    },
    {
      'Nombre': 'Pedro',
      'Descripcion':'Tarea Flutter',
      'Fecha':'12/12/12',
      'Estado':true
    }

  ];
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
    for (Map<String, dynamic> a in tareas) {
      Widget item= ListTile(
        title: Text("Hola ${a['Nombre']}"),
        trailing: (a['Estado']? Text("Completado") : Text("Incompleto")),
      );
      temp.add(item);
    }
    return temp;
  }
}