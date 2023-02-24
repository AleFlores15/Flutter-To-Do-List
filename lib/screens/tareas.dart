import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/screens/tareaform.dart';

  List<Map<String,dynamic>> tareas =[{
    'Nombre': 'a',
    'Estado': true
  }];
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
        body: (tareas.isNotEmpty)? ListView(
          children: _crearTarea(),
        ):Center(child: Text("No hay tareas"),),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{Navigator.pushNamed(context, FormularioTarea.namePage )},
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
  void agrega(Map<String,dynamic> value){
    tareas.add(value);
     print(value['Nombre']);
  }
} 


