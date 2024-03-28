// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
  var username = TextEditingController();
  var password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Incrível Lista'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade100,
      ),
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset(
                'lib/assets/cestocompras.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  labelText: 'Nome de usuário',
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.person_2_outlined)
                ),
                  validator: (value) {
                  if (value == null){
                    return 'Informe o usuário';
                  } else if (value.isEmpty) {
                    return 'Informe o usuário';
                  } 
                  return null;
                },  
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.password_outlined)
                ),
                validator: (value) {
                  if (value == null){
                    return 'Informe a senha';
                  } else if (value.isEmpty) {
                    return 'Informe a senha';
                  } else if (value.length < 8) {
                    return 'A senha tem no mínimo 8 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    var nome = username.text;
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                    // ignore: unnecessary_brace_in_string_interps
                    SnackBar(content: Text('Bem vindo ${nome}'),
                    duration: Duration(seconds: 3),
                    )
                  );
                  });
                }
              }, child: Text('Login')
              )
            ],),
          ),
        ),

    );
  }
}