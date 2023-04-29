import 'package:flutter_bloc/flutter_bloc.dart';
import 'label_state.dart';
import 'package:flutter_to_do_list/services/labels_service.dart';

class Labels{
  LabelProps a= LabelProps();
  static List <LabelProps> labelsdata=[
    LabelProps(  ),

  ];
  
}

class LabelsCubit extends Cubit<LabelState>{
  LabelsCubit() : super(LabelState(labels: Labels.labelsdata, selected: Labels.labelsdata[0].content));

  void updateSelected(String label){
    emit(LabelState(labels: Labels.labelsdata, selected: label));
  }

  void deleteSelected(String label){
    Labels.labelsdata.remove(label);
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
      print('entra a getlabels');
      await labelsService.getLabels();
      emit(state.copyWith(status: LabelStatus.success));
    } on Exception catch(e){
      print("siisisissisiisis");
      print(e);
      emit(state.copyWith(status: LabelStatus.failure));
    }
  
  }

  Future <void> postLabels(String content) async{
    emit(state.copyWith(status: LabelStatus.loading));
    try{
      print('entra a postlabels');
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
      print('entra a putlabels');
      await labelsService.updateLabel(id, content);
      emit(state.copyWith(status: LabelStatus.success));
    } on Exception catch(e){
       emit(state.copyWith(status: LabelStatus.failure));
    }
  
  }


  


}
