import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/screens/tareaform.dart';
import 'package:flutter_to_do_list/screens/login.dart';
List<Map<String,dynamic>> tareas =[];
class Tareas extends StatefulWidget {
  static final pageName= "tareas";

  @override
  _TareasState createState() => _TareasState();
  void agrega(Map<String,dynamic> value){
    tareas.add(value);
    print(value['Nombre']);
  }
}

class _TareasState extends State<Tareas> {
  

  void _cerrarSesion(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to chilipeppers',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _cerrarSesion(context);
              },
            ),
          ],
        ),
        body: (tareas.isNotEmpty)? ListView(
          children: _crearTarea(),
        ):Center(child: Text("No hay tareas"),),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{Navigator.pushNamed(context, FormularioTarea.namePage ).then((value) => setState(() {}))},
          child: Icon(Icons.add),),
      ),
    );
  }
  
  List<Widget> _crearTarea() {
    List<Widget> temp= [];
    
    for (int i = 0; i < tareas.length; i++) {
      Map<String, dynamic> a = tareas[i];
      Widget item= ListTile(
        title: Text("${a['Nombre']}"), 
        subtitle: Text("${a['Fecha']}\n${a['Etiq']}"),
        trailing: ElevatedButton(
          onPressed: () {
            setState(() {
              tareas[i]['Estado'] = 'Completada';
            });
          },
          child: Text("${a['Estado']}"),
        ),
      );
      temp.add(item);
    }

    return temp;
  }
  
  
}
