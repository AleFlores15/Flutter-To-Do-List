import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  //global key es importante
  GlobalKey _form= GlobalKey();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("To do list"),
      ),
      body: Container(
        
        child: SafeArea(
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("images/Inicio.png"),
                Text("Bienvenido a la Aplicacion", style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      ),

    );
  }
}