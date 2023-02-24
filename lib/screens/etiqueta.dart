import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/screens/tareas.dart';

class FormularioEtiqueta extends StatefulWidget {
  const FormularioEtiqueta({super.key});
  static final namePage = "formulario";

  @override
  State<FormularioEtiqueta> createState() => _FormularioEtiquetaState();
}

class _FormularioEtiquetaState extends State<FormularioEtiqueta> {
  final idForm=GlobalKey<FormState>();
  Map<String,dynamic> newLabel={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestionar etiquetas'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: idForm,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (valor){
                    newLabel['Nombre']=valor;

                  } ,
                  decoration: InputDecoration(
                    hintText: "Titulo de la tarea"
                    
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  onSaved: (valor){
                    newLabel['Descripcion']=valor;

                  } ,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Descripcion de la tarea"
                    
                  ),
                ),
                ElevatedButton(onPressed:(){
                  idForm.currentState?.save();
                  newLabel['Estado']="pendiente";
                  Tareas().agrega(newLabel);
                  Navigator.pop(context);
                }, child:Text("Añadir tarea") )
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}