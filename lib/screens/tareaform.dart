import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_to_do_list/screens/tareas.dart';
import 'package:flutter_to_do_list/screens/etiqueta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do_list/bloc/label_cubit.dart';
import 'package:flutter_to_do_list/bloc/label_state.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
  String dateText = '';
  String selected = '';

  @override
  void initState() {
    super.initState();
    dateText = '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
  }

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
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onSaved: (valor) {
                          newTarea['Fecha'] =
                              '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
                        },
                        controller: TextEditingController(text: dateText),
                        decoration: InputDecoration(
                          hintText: "Fecha de la tarea",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(
                          context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime(2100, 12, 31),
                          onConfirm: (date) {
                            setState(() {
                              selectedDate = date;
                              dateText = '${date.day}/${date.month}/${date.year}';
                            });
                          },
                          currentTime: selectedDate,
                          locale: LocaleType.es,
                        );
                      },
                      child: Icon(
                        Icons.calendar_today,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                
                 DropdownButton<String>(
                     
                      onChanged: (String? newValue) {
                        setState(() {
                          selected=newValue!;
                          newTarea['Etiq']=newValue;
                        });
                      },
                      items: etiqueta
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  ),
                
                ElevatedButton(
                  onPressed: () {
                    idForm.currentState?.save();
                    newTarea['Estado'] = "pendiente";
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
                    child: Text("Gestionar etiquetas", style: TextStyle(fontSize: 20))),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}