import 'package:flutter/material.dart';

List<String> etiqueta = ['Trabajo', 'Casa', 'Personal'];

class FormularioEtiqueta extends StatefulWidget {
  const FormularioEtiqueta({Key? key}) : super(key: key);
  static final namePage = "formulario";

  @override
  State<FormularioEtiqueta> createState() => _FormularioEtiquetaState();
}

class _FormularioEtiquetaState extends State<FormularioEtiqueta> {
  final idForm = GlobalKey<FormState>();
  Map<dynamic, dynamic> newLabel = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestionar etiquetas'),
      ),
      body: (etiqueta.isNotEmpty)
          ? Form(
              key: idForm,
              child: ListView(
                children: _crearTarea(),
                physics: BouncingScrollPhysics(),
              ),
            )
          : Center(child: Text("No hay etiqueta")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            etiqueta.add("");
            print(etiqueta.length);
          });
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => FormularioEtiqueta()));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ElevatedButton(
          onPressed: () {
            idForm.currentState!.save();
            setState(() {
              etiqueta = newLabel.values.toList().cast<String>();
            });
            print("Funciona");
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
                newLabel[i] = valor;
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
} 