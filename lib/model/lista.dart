class Lista {
  String nome;
 // String quantidade;

  Lista(this.nome);


  static List<Lista> preencher() {
    List<Lista> listaCompras = [];

    listaCompras.add(Lista('Lista 1'));
    listaCompras.add(Lista('Lista 2'));
    listaCompras.add(Lista('Lista 3'));

    return listaCompras;
  }

}