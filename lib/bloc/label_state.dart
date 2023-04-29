class LabelProps{
   int id=0;
   String content='';
   LabelProps({required this.id, required this.content});


}

enum LabelStatus {init ,loading, success, failure}

class LabelState {
  final List<LabelProps> labels;
  final String selected;
  final LabelStatus status;

  LabelState({required this.labels, required this.selected, this.status=LabelStatus.init});  
  
  LabelState copyWith ({List<LabelProps>? labels, String? selected, LabelStatus? status}){
    return LabelState(
      labels: labels ?? this.labels,
      selected: selected ?? this.selected,
      status: status ?? this.status
    );
  }
  List<Object?> get props => [ labels,selected, status];

  List<String> labelsToStringList() {
    return labels.map((label) => label.content).toList();
  }

}