
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
    emit(state.copyWith(status: TareaStatus.loading));
    try{
      print('entra a gettasks');
      await tareasService.getTareas();
      emit(state.copyWith(status: TareaStatus.success));
    } on Exception catch(e){
      emit(state.copyWith(status: TareaStatus.failure));
    }
  } 



  
}