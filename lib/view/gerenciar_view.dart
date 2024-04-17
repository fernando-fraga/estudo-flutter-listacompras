// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/lista.dart';
import 'gerenciar_itens_view.dart';

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
    void _apagarLista(int index) {
      setState(() {
        listaCompras.removeAt(index);
      });
    }

    void _editarNomeLista(int index, String novoNome) {
      setState(() {
        listaCompras[index].nome = novoNome;
      });
    }

    void _mostrarDialogoEditarOuApagarLista(BuildContext context, int index) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(""),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: nomeLista,
              decoration:
                  InputDecoration(labelText: 'Informe o novo nome da lista'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira o nome da lista';
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _apagarLista(index);
                Navigator.pop(context, 'Apagar');
              },
              child: const Text('Apagar'),
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _editarNomeLista(index, nomeLista.text);
                  Navigator.pop(context, 'Editar');
                }
              },
              child: const Text('Editar'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancelar'),
              child: const Text('Cancelar'),
            ),
          ],
        ),
      );
    }

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

                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(listaCompras[index].nome)));

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GerenciarItensView(listaCompras[index]),
                      ),
                    );
                  },
                  hoverColor: Colors.red.shade100,

                  onLongPress: () {
                    _mostrarDialogoEditarOuApagarLista(context, index);
                    // setState(() {
                    //   listaCompras.removeAt(index);
                    // });
                  },
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
        padding: EdgeInsets.only(right: 16, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'sobre');
                },
                child: Text('Sobre')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Text('Sair'))
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        child: Text("+"),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Criar nova lista'),
                    content: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: nomeLista,
                        decoration: InputDecoration(
                            labelText: 'Informe o nome da lista'),
                        validator: (value) {
                          if (value == null) {
                            return 'Insira o nome da lista';
                          } else if (value.isEmpty) {
                            return 'Insira o nome da lista';
                          }
                          return null;
                        },
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancelar'),
                          child: const Text('Cancelar')),
                      TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                listaCompras.add(
                                    Lista(nome: nomeLista.text, itens: []));
                              });
                              Navigator.pop(context, 'Criar');
                            }
                          },
                          child: const Text('Criar'))
                    ],
                  ));
        },
      ),
    );
  }
}
