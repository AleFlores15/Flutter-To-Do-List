import 'package:equatable/equatable.dart';


class Tareas{
  int id=0;
  String nombre='';
  String fecha='';
  String label='';
  bool completado= false;
}
enum TareaStatus {init ,loading, success, failure}
class TareaState{
  final List<Tareas> tareas;
  final TareaStatus status;

  TareaState({required this.tareas, this.status=TareaStatus.init});

  TareaState copyWith({List<Tareas>? tareas, TareaStatus? status}){
    return TareaState(
      tareas: tareas ?? this.tareas,
      status: status ?? this.status
    );
  }

  @override
  List<Object?> get props => [ tareas, status];
}


