

class Tareas{
  String nombre='';
  String fecha='';
  String label='';
  bool completado= false;
}

class TareaState{

  final List<Tareas> tareas;
  TareaState(this.tareas);
}