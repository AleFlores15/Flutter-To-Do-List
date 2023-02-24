import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 1. Definir el estado
class UsernameFormState {
  final String username;

  UsernameFormState({required this.username});
}

// 2. Crear el Cubit
class UsernameFormCubit extends Cubit<UsernameFormState> {
  UsernameFormCubit() : super(UsernameFormState(username: ''));

  void setUsername(String username) {
    final currentState = state;
    final newState = UsernameFormState(username: username);
    emit(newState);
  }
}

// 3. Construir la interfaz de usuario
class UsernameForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsernameFormCubit(),
      child: BlocBuilder<UsernameFormCubit, UsernameFormState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Formulario de usuario'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nombre de usuario: ${state.username}'),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre de usuario',
                    ),
                    onChanged: (value) {
                      context.read<UsernameFormCubit>().setUsername(value);
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // 4. Agregar más campos
                      // Aquí se puede agregar lógica para agregar más campos
                    },
                    child: Text('Agregar más campos'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Formulario de usuario',
      home: UsernameForm(),
    ),
  );
}
