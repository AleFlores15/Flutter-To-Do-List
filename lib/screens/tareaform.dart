import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_to_do_list/screens/tareas.dart';
import 'package:flutter_to_do_list/screens/etiqueta.dart';

class FormularioTarea extends StatefulWidget {
  const FormularioTarea({Key? key}) : super(key: key);
  static final namePage = "formulario";

  @override
  _FormularioTareaState createState() => _FormularioTareaState();
}

class _FormularioTareaState extends State<FormularioTarea> {
  final idForm = GlobalKey<FormState>();
  Map<String, dynamic> newTarea = {};
  DateTime selectedDate = DateTime.now();

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
                  onSaved: (valor) {
                    newTarea['Nombre'] = valor;
                  },
                  decoration: InputDecoration(
                    hintText: "Titulo de la tarea",
                  ),
                ),
                SizedBox(height: 20),
                
                
                ElevatedButton(
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime.now(),
                      maxTime: DateTime(2100, 12, 31),
                      onConfirm: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                      currentTime: selectedDate,
                      locale: LocaleType.es,
                    );
                  },
                  child: Text(
                    'Seleccionar fecha',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  onSaved: (valor) {
                    newTarea['Nombre'] = valor;
                  },
                  initialValue: 'Fecha seleccionada: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  decoration: InputDecoration(
                    hintText: "Titulo de la tarea",
                  ),
                )
                ,
                Text(
                  'Fecha seleccionada: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                ),
                ElevatedButton(
                  onPressed: () {
                    idForm.currentState?.save();
                    newTarea['Estado'] = "pendiente";
                    newTarea['Fecha'] =
                        '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
                    Tareas().agrega(newTarea);
                    Navigator.pop(context);
                  },
                  child: Text("Añadir tarea"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormularioEtiqueta()));
                    },
                    child: Text("Gestionar", style: TextStyle(fontSize: 20))),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
