import 'package:flutter_to_do_list/bloc/label_state.dart';
import 'package:flutter_to_do_list/screens/todoform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/bloc/label_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LabelsForm extends StatelessWidget {
  int i=0;
  String label1='';

  LabelsForm({super.key});

  //const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LabelsCubit>(context).getLabels();
    return Scaffold(
      appBar: AppBar(title: Text('Etiquetas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<LabelsCubit, LabelState>(
                builder: (context, state) {

                  
                  if (state.labels.isEmpty) {

                    return Text('No hay etiquetas');
                    
                  } else {
                    return ListView.builder(
                      itemCount: state.labels.length,
                      itemBuilder: (context, index) {
                        LabelProps label = state.labels[index];
                        label.content = state.labels[index].content;
                        return Row(
                          children: [
                            const SizedBox(height: 100),
                            Expanded(
                              child: TextField(

                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4))
                                  ),
                                  filled: true,

                                ),
                                
                                
                                onChanged: (text) {
                                  i=index;
                                  label1=text;
                                },
                                controller: TextEditingController(text: label.content), textDirection: TextDirection.ltr,
                        
                              ),
                            ),

                            // boton que aparece en el textfield para borrar la etiqueta

                            IconButton(
                              onPressed: () {
                                context.read<LabelsCubit>().deleteSelected(label);
                              },
                              icon:  const Icon(Icons.delete),
                            ),
                          ],
                        );
                      },
                    );
                    
                  }
                },
              )
            ),

            // Boton para guardar

            ElevatedButton.icon(
              onPressed: (){
                context.read<LabelsCubit>().updateLabel(i, label1);
                BlocProvider.of<LabelsCubit>(context).putLabels(findLabelId(label1,Labels.labelsdata),label1);
              }, 
              icon: const Icon(Icons.save), 
              label: const Text('Guardar')
            ),


            const SizedBox(height: 10),

            // Boton para cerrar

            ElevatedButton.icon(
              onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => Todo() ));},
              icon: const Icon(Icons.close), 
              label: const Text('Cerrar')
            ),
            
            // Boton para agregar nueva etiqueta vacía

            ElevatedButton.icon(

              onPressed: (){
                LabelProps label = LabelProps(id:1 ,content:'');
                context.read<LabelsCubit>().addLabel(LabelProps(id: 0, content: ''));
                BlocProvider.of<LabelsCubit>(context).postLabels(label.content);
              }, 
              icon: const Icon(Icons.new_label), 
              label: const Text('Nueva etiqueta')
            ),
          ],
        ),
      ),
    );
  }

  int findLabelId(String content, List<LabelProps> labels) {
  for (var i = 0; i < labels.length; i++) {
    if (labels[i].content == content) {
      return labels[i].id;
    }
  }
  return 3;
}
}
