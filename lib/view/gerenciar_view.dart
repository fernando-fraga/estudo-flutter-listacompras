// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/lista.dart';

class GerenciarView extends StatefulWidget {
  const GerenciarView({super.key});

  @override
  State<GerenciarView> createState() => _GerenciarViewState();
}

class _GerenciarViewState extends State<GerenciarView> {
  List<Lista> listaCompras = [];
  var nomeLista = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    listaCompras = Lista.preencher();
    super.initState();
    nomeLista = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Listas'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade100,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: ListView.builder(
          itemCount: listaCompras.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(

                leading: Icon(Icons.person_2_outlined),

                title: Text(listaCompras[index].nome),
                //subtitle: Text(listaCompras[index].quantidade),

                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(listaCompras[index].nome))    
                  );
                },
                hoverColor: Colors.red.shade100,

                onLongPress: (){
                  setState(() {
                    listaCompras.removeAt(index);
                  });
                },

              ),
            );
           }
          ),
          
      ),

      
      floatingActionButton: FloatingActionButton(
        child: Text("+"),
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context) => AlertDialog(
            title: const Text('Criar nova lista'),
            content: Form(
              key: formKey,
              child: TextFormField(
                
              ),
            ),
          ) );
        },
      ),
      
    );
  }
}