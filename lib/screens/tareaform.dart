import 'package:flutter/material.dart';

class FormularioTarea extends StatefulWidget {
  const FormularioTarea({super.key});
  static final namePage = "formulario";

  @override
  State<FormularioTarea> createState() => _FormularioTareaState();
}

class _FormularioTareaState extends State<FormularioTarea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir tarea nueva'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Titulo de la tarea"
                  
                ),
              ),
              TextFormField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Descripcion de la tarea"
                  
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}