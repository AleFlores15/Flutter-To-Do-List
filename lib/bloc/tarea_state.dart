

class Tareas{
  int id=0;
  String nombre='';
  String fecha='';
  String label='';
  bool completado= false;
}

class TareaState{
  // final List<Tareas> tareas;
  final List<Tareas> tareas;
  TareaState({required this.tareas});
}