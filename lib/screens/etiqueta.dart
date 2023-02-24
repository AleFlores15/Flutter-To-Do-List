import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/screens/tareas.dart';
List<String> etiqueta  =['Algo','ALGO2','ALGO3'];
class FormularioEtiqueta extends StatefulWidget {
  const FormularioEtiqueta({super.key});
  static final namePage = "formulario";
  

  @override
  State<FormularioEtiqueta> createState() => _FormularioEtiquetaState();
}

class _FormularioEtiquetaState extends State<FormularioEtiqueta> {
  final idForm=GlobalKey<FormState>();
  Map<dynamic,dynamic> newLabel={};
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    title: Text('Gestionar etiquetas'),
  ),
  body: (etiqueta.isNotEmpty)
      ? ListView(
          children: _crearTarea(),
          physics: BouncingScrollPhysics(),
        )
      : Center(child: Text("No hay etiqueta")),
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      setState(() {
        etiqueta.add("");
        print(etiqueta.length);
      });
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => FormularioEtiqueta()));
    },
    child: Icon(Icons.add),
  ),
  bottomNavigationBar: Container(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: ElevatedButton(
      onPressed: () {
        // TODO: handle button press
      },
      child: Text('Guardar'),
    ),
  ),
);

  }

    List<Widget> _crearTarea() {
  List<Widget> temp = [];

  for (int i = 0; i < etiqueta.length; i++) {
    Widget item = Row(
      children: [
        Expanded(
          child: TextFormField(
            onSaved: (valor) {
              newLabel['Nombre'] = valor;
            },
            initialValue: etiqueta[i],
            decoration: InputDecoration(hintText: "Nombre de la etiqueta"),
          ),
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              etiqueta.removeAt(i);
            });
          },
        ),
      ],
    );
    temp.add(item);
  }

  return temp;
}

 void agrega() {
    print(etiqueta.length);
    etiqueta.add("a");
    print(etiqueta.length);
  
}



}