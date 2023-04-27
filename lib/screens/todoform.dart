import 'package:flutter_to_do_list/bloc/label_state.dart';
import 'package:flutter_to_do_list/bloc/tarea_cubit.dart';
import 'package:flutter_to_do_list/bloc/tarea_state.dart';
import 'package:flutter_to_do_list/screens/labels.dart';
import 'package:flutter_to_do_list/screens/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/bloc/label_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';


class Todo extends StatelessWidget {
  const Todo({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: MultiBlocProvider (
        providers: [
          BlocProvider(
            create: (context) => LabelsCubit(),
          ),
          BlocProvider(
            create: (context) => TareasCubit(),
          ),
        ],
        child: Inicio(),
      ),
    );
  }
}



class Inicio extends StatelessWidget {
  final _tituloController = TextEditingController();
  final _fechaController = TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose();
    _fechaController.dispose();
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Añadir Tarea')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<LabelsCubit, LabelState>(
              builder: (context, state) {
                return Column(
                  children: [
                    TextFormField(
                      controller: _tituloController,
                      decoration: const InputDecoration(
                        hintText: "Titulo de la tarea",
                      ),
                    ),
                    const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime(2022, 1, 1),
                        maxTime: DateTime(2025, 12, 31),
                        onConfirm: (date) {
                          final formattedDate = DateFormat('dd/MM/yyyy').format(date);
                          _fechaController.text = formattedDate;
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.es,
                      );
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _fechaController,
                        decoration: const InputDecoration(
                          hintText: "Fecha",
                        ),
                      ),
                    ),
                  ),

                    DropdownButton<String>(
                      value: state.selected,
                      onChanged: (String? newValue) {
                        context
                            .read<LabelsCubit>()
                            .updateSelected(newValue ?? "");
                      },
                      items: state.labelsToStringList().map((label) {
                          return DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          );
                        }).toList(),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          final id = state.labels.length + 1;
                          final titulo = _tituloController.text;
                          final fecha = _fechaController.text;
                          final tarea = Tareas();
                          tarea.nombre=titulo;
                          tarea.fecha=fecha;
                          tarea.label=state.selected;
                          tarea.completado=false;
                          context.read<TareasCubit>().addTarea(tarea);
                          _tituloController.clear();
                          _fechaController.clear();
                          print(tarea.label);
                          BlocProvider.of<TareasCubit>(context).postTasks(titulo, fecha, id);
                          Navigator.push(context,MaterialPageRoute(builder: (context) => todolist()));
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Añadir Tarea')),
                  
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LabelsForm()));
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Gestionar Etiquetas')),
                    
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => todolist()));
                        },
                        icon: const Icon(Icons.close),
                        label: const Text('Cancelar')),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
