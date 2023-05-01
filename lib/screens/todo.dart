import 'package:flutter_to_do_list/bloc/label_cubit.dart';
import 'package:flutter_to_do_list/bloc/tarea_state.dart';
import 'package:flutter_to_do_list/bloc/tarea_cubit.dart';
import 'package:flutter_to_do_list/screens/todoform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//bool isCalled = false;


class Todolist extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LabelsCubit>(context).getLabels();
    BlocProvider.of<TareasCubit>(context).getTasks();
    
    
    return Scaffold(
      appBar: AppBar(title: const Text('Tareas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<TareasCubit, TareaState>(
                builder: (context, state) {
                  if(state.status== TareaStatus.loading){
                    return const Center(child: CircularProgressIndicator());
                  }else if(state.status== TareaStatus.success){
                    
                      if (state.tareas.isEmpty) {
                          return const Center(child: Text('No hay tareas'));
                        } else {
                          return ListView.builder(
                          
                            itemCount: state.tareas.length,
                            itemBuilder: (context, index) {
                              
                              Tareas tarea = state.tareas[index];
                              return Row(
                                children: [
                                  const SizedBox(height: 100),
                                  Expanded(
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),

                                        // abajo se llama al widget contenido que
                                        //contiene todo lo de la tarjeta (tarea)

                                        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                  const Text("Tarea: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                  Text(tarea.nombre, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                ],
            ),



            const SizedBox(height: 8.0),

            Row(
              children: [
                const Text("Fecha: ", style: TextStyle(fontSize: 16.0)),
                Text(tarea.fecha, style: const TextStyle(fontSize: 16.0)),

              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Text("Etiqueta: ", style: TextStyle(fontSize: 16.0)),
                Text(tarea.label, style: const TextStyle(fontSize: 16.0)),

              ],
            ),
              const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                context.read<TareasCubit>().updateTarea(tarea,tarea.id);
                BlocProvider.of<TareasCubit>(context).putTasks(tarea.id, tarea.nombre, tarea.fecha, findTaskId(tarea.label, Tarea.tareasdata), tarea.completado);
                           
              },

              child: Text(tarea.completado ? 'Completado' : 'No completado'),
            ),
          ],
        )

                                      ),
                                    ),
                                  ),
                                ],
                              );

                            },
                          );
                          
                        }
                   
                    
                  }else if(state.status== TareaStatus.init){
                    
                   return const Center(child: CircularProgressIndicator());
                      
                    
                    
                  }else{
                    return const Center(child: Text('Error'));
                  }
                  
 
                },
              )
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        //BlocProvider.of<LabelsCubit>(context).getLabels();
        Navigator.push(context,MaterialPageRoute(builder: (context) => Todo() ));},
      child: Icon(Icons.add),),
    );
  }
}


  int findTaskId(String content, List<Tareas> labels) {
    for (var i = 0; i < labels.length; i++) {
      if (labels[i].label == content) {
        return labels[i].id;
      }
    }
    return 3;
  }

  