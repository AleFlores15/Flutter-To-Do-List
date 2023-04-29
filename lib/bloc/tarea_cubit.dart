
import 'dart:developer';

import 'package:flutter_to_do_list/bloc/tarea_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do_list/services/tareas_service.dart';

class Tarea{
  static List <Tareas> tareasdata=[
    
  ];
}

class TareasCubit extends Cubit<TareaState>{
  TareasCubit() : super(TareaState(tareas: Tarea.tareasdata));

  void addTarea (Tareas tarea){
    Tarea.tareasdata.add(tarea);
    print('tareas: ');
    print(Tarea.tareasdata.length);
    emit(TareaState(tareas: Tarea.tareasdata));
  }

  void deleteTarea (Tareas tarea){
    Tarea.tareasdata.remove(tarea);
    emit(TareaState(tareas: Tarea.tareasdata));
  }
  void updateTarea (Tareas tarea, int index){
    Tarea.tareasdata[index].completado = !Tarea.tareasdata[index].completado;
    emit(TareaState(tareas: Tarea.tareasdata));
  }
 


  void saveTareas (){
    Tarea.tareasdata = state.tareas;
    emit(TareaState(tareas: Tarea.tareasdata));
    
  }

  Future <void> getTasks() async{
    //emit(state.copyWith(status: TareaStatus.loading));
    try{
      print('entra a gettasks');
      await tareasService.getTareas();
      log(await tareasService.getTareas().toString());
      emit(state.copyWith(status: TareaStatus.success));
    } on Exception catch(e){
      emit(state.copyWith(status: TareaStatus.failure));
    }
  } 

  Future <void> postTasks(String desc, String date, int id) async{
    emit(state.copyWith(status: TareaStatus.loading));
    try{
      print('entra a posttasks');
      await tareasService.postTareas(desc, date, id);
      emit(state.copyWith(status: TareaStatus.success));
    } on Exception catch(e){
      print(e);
      emit(state.copyWith(status: TareaStatus.failure));
    }
  } 

void parseTareas(dynamic response) {
  print(response);
  List<dynamic> tareasJson = response;
  print('Watefeeeeeeeeeeeeeeeeeeeeeeeeec');
  
  // Imprimir lista de tareas antes de agregar las tareas
  print('Lista de tareas antes de agregar las tareas:');
  Tarea.tareasdata.forEach((tarea) => print(tarea.id));
  
  for (var tareaJson in tareasJson) {
    int id = tareaJson['taskId'];
    bool existe = Tarea.tareasdata.any((tarea) => tarea.id == id);
    if (!existe) {
      Tareas tarea = Tareas();
      tarea.id = id;
      tarea.nombre = tareaJson['description'] ?? '';
      tarea.fecha = tareaJson['date'] ?? '';
      tarea.completado = false;
      tarea.label = 'holis';
      Tarea.tareasdata.add(tarea);
    }
  }

  // Imprimir lista de tareas después de agregar las tareas
  print('Lista de tareas después de agregar las tareas:');
  Tarea.tareasdata.forEach((tarea) => print(tarea.id));
  
  emit(TareaState(tareas: Tarea.tareasdata));
}






  
}