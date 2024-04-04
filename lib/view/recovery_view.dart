// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RecoveryView extends StatefulWidget {
  const RecoveryView({super.key});

  @override
  State<RecoveryView> createState() => _RecoveryViewState();
}

class _RecoveryViewState extends State<RecoveryView> {
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueci minha senha'),
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
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Informe o e-mail de cadastro',
                  border: UnderlineInputBorder(),
                  prefix: Icon(Icons.person_2_outlined)
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Informe um endereço de e-mail válido';
                  }
                  else if (value.isEmpty) {
                    return 'Informe um endereço de e-mail válido';
                  }
                  return null;
                },
              ), 
              SizedBox(height: 100),
              ElevatedButton(onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        var endereco = email.text;

                        ScaffoldMessenger.of(context).showSnackBar(
                        // ignore: unnecessary_brace_in_string_interps
                        SnackBar(content: Text('Foi enviado um e-mail para recuperação de senha para endereço: ${endereco}'),
                        duration: Duration(seconds: 3),
                        )
                      );
                      });
                      Navigator.pushNamed(context, 'login');
                    }
                  }, child: Text('Redefinir senha')
                  ),


            ],
          ),
        ),
      ),
    );
  }
}