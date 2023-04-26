import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do_list/bloc/login_cubit.dart';
import 'package:flutter_to_do_list/bloc/login_state.dart';
import 'package:flutter_to_do_list/bloc/tarea_state.dart';
import 'package:flutter_to_do_list/screens/todo.dart';
import 'package:flutter_to_do_list/screens/todoform.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  //global key es importante
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP"),
      ),
      body: Container(
        
        child: BlocBuilder <LoginCubit, LoginState>(
          builder: (context,state){
            if(state.status== LoginStatus.init){
              return _loginForm(context);
            }else if( state.status== LoginStatus.loading){
              return Center(child: CircularProgressIndicator());
            }else if(state.status== LoginStatus.success){
              // return Navigator.push(context, MaterialPageRoute(builder: (context)=> todolist()));
            }else if (state.status== LoginStatus.failure){
              return const Text('Error al iniciar sesion');
            }else{
              return  const Text('Error ');
            }
            return  const Text('Error ');

          },
          )

      ),

    );
  }
}

Widget _loginForm(BuildContext context){
  return          SafeArea(
          child: Form(
            
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  const Text("Bienvenido a\nTODO APP", style: TextStyle(fontSize: 30),textAlign: TextAlign.center),
                  const SizedBox( height: 50,),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.all(Radius.circular(60))),

                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.face,color: Theme.of(context).primaryColor),
                        labelStyle: TextStyle(color: Theme.of(context).primaryColor), 
                        border: InputBorder.none,
                        labelText: "Usuario"
                      ),

                    ),
                  ),
                  SizedBox(height:15),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(color: Colors.grey.shade200,borderRadius: BorderRadius.all(Radius.circular(60))),

                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_sharp,color: Theme.of(context).primaryColor),
                        labelStyle: TextStyle(color: Theme.of(context).primaryColor), 
                        border: InputBorder.none,
                        labelText: "Contraseña"
                      ),

                    ),
                  ),
                  SizedBox(height:15),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => todolist() ));} ,child: Text("Ingresar", style: TextStyle(fontSize: 20))),
                  SizedBox(height:15),
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    
                    ElevatedButton(onPressed: (){
                      
                    },child: Text("Registrarse"))
                  ],)

                ],
              ),
            ),
          ),
        );
}