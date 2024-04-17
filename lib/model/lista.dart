class Lista {
  String nome;

  Lista({required this.nome});


  static List<Lista> preencher() {
    List<Lista> listaCompras = [];

    listaCompras.add(Lista(nome:'Lista 1'));
    listaCompras.add(Lista(nome:'Lista 2'));
    listaCompras.add(Lista(nome:'Lista 3'));

    return listaCompras;
  }

}