import 'package:flutter_bloc/flutter_bloc.dart';
import 'label_state.dart';
import 'package:flutter_to_do_list/services/labels_service.dart';

class Labels{
  static List <LabelProps> labelsdata=[ LabelProps(id: 0, content: 'Sin etiqueta')];
  
}

class LabelsCubit extends Cubit<LabelState>{
  LabelsCubit() : super(LabelState(labels: Labels.labelsdata, selected:
   Labels.labelsdata.isEmpty ? '' : Labels.labelsdata[0].content));

  void updateSelected(String label){
    emit(LabelState(labels: Labels.labelsdata, selected: label));
  }

  void deleteSelected(String label){
    print('por queeeeeeeeeeeeeeeee');
    Labels.labelsdata.remove(label);
    print(Labels.labelsdata);
    emit(LabelState(labels: Labels.labelsdata, selected: Labels.labelsdata[0].content));
  }

  void addLabel (LabelProps label){
    Labels.labelsdata.add(label);
    emit(LabelState(labels: Labels.labelsdata, selected: Labels.labelsdata[0].content));
  }

  void updateLabel(int index, String newLabel) {
    Labels.labelsdata[index].content = newLabel;
    emit(LabelState(labels: Labels.labelsdata, selected: newLabel));
    updateSelected(newLabel);
  }
  void saveLabels (){
    Labels.labelsdata = state.labels;
    emit(LabelState(labels: Labels.labelsdata, selected: Labels.labelsdata[0].content));
  }

  Future <void> getLabels() async{
    emit(state.copyWith(status: LabelStatus.loading));
    try{
      await labelsService.getLabels();
      emit(state.copyWith(status: LabelStatus.success));
    } on Exception catch(e){
      emit(state.copyWith(status: LabelStatus.failure));
    }
  
  }

  Future <void> postLabels(String content) async{
    emit(state.copyWith(status: LabelStatus.loading));
    try{
      await labelsService.postLabel(content);
      emit(state.copyWith(status: LabelStatus.success));
    } on Exception catch(e){
       emit(state.copyWith(status: LabelStatus.failure));
    }
  
  }

  // update labels
  Future <void> putLabels(int id, String content) async{
    emit(state.copyWith(status: LabelStatus.loading));
    try{
      await labelsService.updateLabel(id, content);
      emit(state.copyWith(status: LabelStatus.success));
    } on Exception catch(e){
       emit(state.copyWith(status: LabelStatus.failure));
    }
  
  }

  void parseLabels(dynamic response) {
    List<dynamic> labelsJson = response;


    for(var labelJson in labelsJson){
      int id = labelJson['labelId'];
      bool existe = Labels.labelsdata.any((label) => label.id == id);
      if(!existe){
        LabelProps label = LabelProps(id: id, content: labelJson['name']);
        Labels.labelsdata.add(label);
      }
    }
    emit(LabelState(labels: Labels.labelsdata, selected: Labels.labelsdata[0].content));

  }

  String Label(int id){
    String label = '';
    for(var labelJson in Labels.labelsdata){
      if(labelJson.id == id){
        label = labelJson.content;
      }
    }
    return label;
  }

  


}
