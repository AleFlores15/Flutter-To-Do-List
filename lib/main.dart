import 'package:flutter_to_do_list/bloc/label_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do_list/bloc/login_cubit.dart';
import 'package:flutter_to_do_list/bloc/tarea_cubit.dart';
import 'package:flutter_to_do_list/screens/labels.dart';
import 'package:flutter_to_do_list/screens/todo.dart';
import 'package:flutter_to_do_list/screens/todoform.dart';
import './screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create:(context) => LabelsCubit(), child: LoginScreen()
          ),
          BlocProvider(
            create: (context) => LoginCubit(), child: LoginScreen(),
          ),
          BlocProvider(
            create: (context) => TareasCubit(), child: Todolist(),
          ),
          BlocProvider(
             create: (context) => LabelsCubit(), child: LabelsForm(),
          ),
          BlocProvider(
            create:(context) => LabelsCubit(), child: Todo(),
          ),
          BlocProvider(
            create: (context) => TareasCubit(), child: Todo(),
          ),
        ],
        child: MaterialApp(
        title: 'Mi App',
        home: LoginScreen(),
      ),

    );
  }
}

