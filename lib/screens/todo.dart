import 'package:flutter_to_do_list/bloc/tarea_state.dart';
import 'package:flutter_to_do_list/bloc/tarea_cubit.dart';
import 'package:flutter_to_do_list/screens/todoform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/bloc/label_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class todolist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: BlocProvider(
        create:(context) => TareasCubit(), child:  inicio()
      ),
    );
  }
}


class inicio extends StatefulWidget {

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tareas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<TareasCubit, TareaState>(
                builder: (context, state) {
                  if (state.tareas.isEmpty) {
                    return Center(child: Text('No hay tareas'));
                  } else {
                    return ListView.builder(
                      itemCount: state.tareas.length,
                      itemBuilder: (context, index) {
                        Tareas tarea = state.tareas[index];
                        return Row(
                          children: [
                            SizedBox(height: 100),
                            Expanded(
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                            Text("Tarea: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                            Text(tarea.nombre, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                          ],
                                      ),



                                      SizedBox(height: 8.0),

                                      Row(
                                        children: [
                                          Text("Fecha: ", style: TextStyle(fontSize: 16.0)),
                                          Text(tarea.fecha, style: TextStyle(fontSize: 16.0)),

                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          Text("Etiqueta: ", style: TextStyle(fontSize: 16.0)),
                                          Text(tarea.label, style: TextStyle(fontSize: 16.0)),

                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      ElevatedButton(
                                        onPressed: () {
                                          
                                          context.read<TareasCubit>().updateTarea(tarea,index);
                                        },
                                        child: Text(tarea.completado ? 'Completado' : 'No completado'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );

                      },
                    );
                    
                  }
                },
              )
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Todo() ));},
      child: Icon(Icons.add),),
    );
  }
}

                            //  IconButton(
                            //    onPressed: () {
                            //     context.read<TareasCubit>().deleteSelected(label);
                            //    },
                            //    icon: Icon(Icons.delete),
                            //  ),