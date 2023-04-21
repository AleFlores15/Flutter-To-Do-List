class LabelProps{
  final int id=0;
  final String content='';
}

class LabelState {
  final List<String> labels;
  final String selected;

  LabelState({required this.labels, required this.selected});  

}