// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
var username = TextEditingController();
var email = TextEditingController();
var password = TextEditingController();
bool senhaVisivel = false;

var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faça seu cadastro já'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade50,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset(
                'lib/imagens/cestocompras.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 30,),
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  labelText: 'Informe o nome de usuário',
                  border: UnderlineInputBorder(),
                  prefix: Icon(Icons.person_2_outlined)
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Informe o nome de usuário';
                  }
                  else if (value.isEmpty) {
                    return 'Informe o nome de usuário';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30,),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Informe o e-mail',
                  border: UnderlineInputBorder(),
                  prefix: Icon(Icons.person_2_outlined)
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Informe o endereço de e-mail usuário';
                  }
                  else if (value.isEmpty) {
                    return 'Informe o endereço de e-mail usuário';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: password,
                obscureText: senhaVisivel,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: UnderlineInputBorder(),
                  prefix: Icon(Icons.password_outlined),
                  suffix: ElevatedButton(child: Icon(Icons.visibility), onPressed: () {
                    setState(() {
                      senhaVisivel = !senhaVisivel;   
                    });
                  },
                  )
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
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      }, child: Text('Voltar')
                  ),
                  ElevatedButton(onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        var nome = username.text;

                        ScaffoldMessenger.of(context).showSnackBar(
                        // ignore: unnecessary_brace_in_string_interps
                        SnackBar(content: Text('Você foi cadastrado com sucesso, Sr(a). ${nome}'),
                        duration: Duration(seconds: 3),
                        )
                      );
                      });
                      Navigator.pushNamed(context, 'login');
                    }
                  }, child: Text('Cadastrar')
                  ),
                ],
              ),
            ],
            ),
          ),
      ),
    );
  }
}