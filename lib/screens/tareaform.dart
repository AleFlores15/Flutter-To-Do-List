import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/screens/tareas.dart';

class FormularioTarea extends StatefulWidget {
  const FormularioTarea({super.key});
  static final namePage = "formulario";

  @override
  State<FormularioTarea> createState() => _FormularioTareaState();
}

class _FormularioTareaState extends State<FormularioTarea> {
  final idForm=GlobalKey<FormState>();
  Map<String,dynamic> newTarea={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir tarea nueva'),
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
                    newTarea['Nombre']=valor;

                  } ,
                  decoration: InputDecoration(
                    hintText: "Titulo de la tarea"
                    
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  onSaved: (valor){
                    newTarea['Descripcion']=valor;

                  } ,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Descripcion de la tarea"
                    
                  ),
                ),
                ElevatedButton(onPressed:(){
                  idForm.currentState?.save();
                  newTarea['Estado']="pendiente";
                  Tareas().agrega(newTarea);
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