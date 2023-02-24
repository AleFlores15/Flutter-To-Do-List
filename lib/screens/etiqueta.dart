import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/screens/tareas.dart';
List<String> etiqueta  =['Algo','ALGO2','ALGO3'];
class FormularioEtiqueta extends StatefulWidget {
  const FormularioEtiqueta({super.key});
  static final namePage = "formulario";
  

  @override
  State<FormularioEtiqueta> createState() => _FormularioEtiquetaState();
}

class _FormularioEtiquetaState extends State<FormularioEtiqueta> {
  final idForm=GlobalKey<FormState>();
  Map<dynamic,dynamic> newLabel={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestionar etiquetas'),
      ),
      body: (etiqueta.isNotEmpty)? ListView(
          children: _crearTarea(),
        ):Center(child: Text("No hay etiqueta"),),
        floatingActionButton: FloatingActionButton(
          onPressed: ()  { setState(() {
            etiqueta.add(""); print(etiqueta.length);
          });  
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context )=>FormularioEtiqueta()));
          },
          child: Icon(Icons.add),),

    );
  }

    List<Widget> _crearTarea() {
    List<Widget> temp= [];

        for (String a in etiqueta) {
          
          Widget item= TextFormField(
                  onSaved: (valor){
                     newLabel['Nombre']=valor;
                  } ,
                  initialValue: a,
                  decoration: InputDecoration(
                    hintText: "Nombre de la etiqueta"        
                  ),
                );
          temp.add(item);
        }
    
        
  
    return temp;
  }
 void agrega() {
    print(etiqueta.length);
    etiqueta.add("a");
    print(etiqueta.length);
  
}



}