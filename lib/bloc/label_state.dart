class LabelProps{
   int id=0;
   String content='';
}

class LabelState {
  final List<LabelProps> labels;
  final String selected;

  LabelState({required this.labels, required this.selected});  
  
  List<String> labelsToStringList() {
    return labels.map((label) => label.content).toList();
  }

}