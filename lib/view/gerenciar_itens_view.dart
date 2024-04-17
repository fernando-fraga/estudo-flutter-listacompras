// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:lista_compras/model/produtos.dart';
import '../model/lista.dart';

class GerenciarItensView extends StatefulWidget {
  final Lista lista;
  const GerenciarItensView(this.lista, {super.key});

  @override
  State<GerenciarItensView> createState() => _GerenciarItensViewState();
}

class _GerenciarItensViewState extends State<GerenciarItensView> {
  late TextEditingController _nomeProdutoController;
  late TextEditingController _quantidadeController;

  @override
  void initState() {
    super.initState();
    _nomeProdutoController = TextEditingController();
    _quantidadeController = TextEditingController();
  }

  @override
  void dispose() {
    _nomeProdutoController.dispose();
    _quantidadeController.dispose();
    super.dispose();
  }

  _adicionarItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Item'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nomeProdutoController,
                  decoration: InputDecoration(labelText: 'Nome do Produto'),
                ),
                TextField(
                  controller: _quantidadeController,
                  decoration: InputDecoration(labelText: 'Quantidade'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final nomeProduto = _nomeProdutoController.text;
                  final quantidade =
                      int.tryParse(_quantidadeController.text) ?? 0;
                  widget.lista.itens.add(Produtos(
                      nomeProduto: nomeProduto, quantidade: quantidade));
                });
                Navigator.of(context).pop();
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  _editarItem(int index) {
    _nomeProdutoController.text = widget.lista.itens[index].nomeProduto;
    _quantidadeController.text =
        widget.lista.itens[index].quantidade.toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Item'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nomeProdutoController,
                  decoration: InputDecoration(labelText: 'Nome do Produto'),
                ),
                TextField(
                  controller: _quantidadeController,
                  decoration: InputDecoration(labelText: 'Quantidade'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.lista.itens[index].nomeProduto =
                      _nomeProdutoController.text;
                  widget.lista.itens[index].quantidade =
                      int.tryParse(_quantidadeController.text) ?? 0;
                });
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.lista.itens.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: Text('Excluir'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lista.nome),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          _adicionarItem();
          // setState(() {
          //   widget.lista.itens
          //       .add(Produtos(nomeProduto: 'Teste', quantidade: 5));
          // });
        },
      ),
      body: ListView.builder(
        itemCount: widget.lista.itens.length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Row(
              children: [
                Checkbox(
                  value: widget.lista.itens[index].isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.lista.itens[index].isChecked = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    '${widget.lista.itens[index].nomeProduto} - Quantidade: ${widget.lista.itens[index].quantidade}',
                  ),
                ),
              ],
            ),
            onLongPress: () {
              _editarItem(index);
            },
          );
          // return ListTile(
          //   title: Text(
          //       '${widget.lista.itens[index].nomeProduto} - Quantidade: ${widget.lista.itens[index].quantidade}, Checked: ${widget.lista.itens[index].isChecked}'),
          // );
        }),
      ),
    );
  }
}
