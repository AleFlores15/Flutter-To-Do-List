import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/screens/tareaform.dart';

  List<Map<String,dynamic>> tareas =[];
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
    
      //tareas.clear();
        print("${tareas.length} aaaa");
        print(tareas[0]);
        for (Map<String, dynamic> a in tareas) {
          print(tareas.length);
          Widget item= ListTile(
            title: Text("${a['Nombre']}"), 
            subtitle: Text("${a['Descripcion']}\nhola"),
            trailing:  Text("${a['Estado']}"),
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


