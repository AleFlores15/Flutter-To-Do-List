import 'package:flutter_to_do_list/bloc/label_state.dart';
import 'package:flutter_to_do_list/screens/todoform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/bloc/label_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabelsForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: BlocProvider(
        create:(context) => LabelsCubit(), child:  inicio()
      ),
    );
  }
}


class inicio extends StatefulWidget {

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {

  int i=0;
  String label1='';
  @override
  Widget build(BuildContext context) {
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
                        String label = state.labels[index];
                        return Row(
                          children: [
                            SizedBox(height: 100),
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
                                controller: TextEditingController(text: label), textDirection: TextDirection.ltr,
                                
                                

                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<LabelsCubit>().deleteSelected(label);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        );
                      },
                    );
                    
                  }
                },
              )
            ),
            ElevatedButton.icon(
              onPressed: (){
                context.read<LabelsCubit>().updateLabel(i, label1);
              }, 
              icon: const Icon(Icons.save), 
              label: const Text('Guardar')
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Todo() ));},
              icon: const Icon(Icons.close), 
              label: const Text('Cerrar')
            ),
            
            ElevatedButton.icon(
              onPressed: (){context.read<LabelsCubit>().addLabel('');}, 
              icon: const Icon(Icons.new_label), 
              label: const Text('Nueva etiqueta')
            ),
          ],
        ),
      ),
    );
  }
}