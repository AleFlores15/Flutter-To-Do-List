import 'package:flutter/material.dart';

class Tareas extends StatelessWidget {
  static final pageName= "tareas";
  static final List<Map<String,dynamic>> tareas =[
 


  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to chilipeppers',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: (tareas.isNotEmpty)? ListView(
          children: _crearTarea(),
        ):Center(child: Text("No hay tareas"),),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{},
          child: Icon(Icons.add),),
      ),
    );
  }
  
  List<Widget> _crearTarea() {
    List<Widget> temp= [];
    for (Map<String, dynamic> a in tareas) {
      Widget item= ListTile(
        title: Text("Hola ${a['Nombre']}"),
        trailing: (a['Estado'])? Text("Completado") : Text("Incompleto"),
      );
      temp.add(item);
    }
    return temp;
  }
}