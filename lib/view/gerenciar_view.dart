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

  @override
  void initState() {
    listaCompras = Lista.preencher();
    super.initState();
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
          setState(() {
            listaCompras.add(
              Lista('Lista ${listaCompras.length+1}')
            );
          });

        },
      ),
    );
  }
}