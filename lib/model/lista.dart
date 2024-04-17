import 'produtos.dart';

class Lista {
  String nome;
  List<Produtos> itens;

  Lista({required this.nome, required this.itens});


  static List<Lista> preencher() {
    List<Lista> listaCompras = [];

    listaCompras.add(Lista(nome:'Lista 1',itens: []));
    listaCompras.add(Lista(nome:'Lista 2',itens: []));
    listaCompras.add(Lista(nome:'Lista 3',itens: []));

    return listaCompras;
  }

}