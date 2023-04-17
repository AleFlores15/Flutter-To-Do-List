import 'package:flutter_bloc/flutter_bloc.dart';
import 'label_state.dart';


class Labels{
  static List <String> labelsdata=[
    'b',
    'ab',
    'ca',
    'xd'
  ];
}

class LabelsCubit extends Cubit<LabelState>{
  LabelsCubit() : super(LabelState(labels: Labels.labelsdata, selected: Labels.labelsdata[0]));

  void updateSelected(String label){
    emit(LabelState(labels: Labels.labelsdata, selected: label));
  }

  void deleteSelected(String label){
    Labels.labelsdata.remove(label);
    emit(LabelState(labels: Labels.labelsdata, selected: Labels.labelsdata[0]));
  }

  void addLabel (String label){
    Labels.labelsdata.add(label);
    emit(LabelState(labels: Labels.labelsdata, selected: Labels.labelsdata[0]));
  }

void updateLabel (String label, String newLabel){
  Labels.labelsdata[Labels.labelsdata.indexOf(label)] = newLabel;
  emit(LabelState(labels: Labels.labelsdata, selected: newLabel));
  updateSelected(newLabel);
}
void saveLabels (){
  Labels.labelsdata = state.labels;
  emit(LabelState(labels: Labels.labelsdata, selected: Labels.labelsdata[0])); 
}
}
