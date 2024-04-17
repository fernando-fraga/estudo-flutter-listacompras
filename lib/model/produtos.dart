class Produtos {
 String nomeProduto;
 int quantidade;
 bool isChecked;
  

 Produtos({required this.nomeProduto, required this.quantidade, this.isChecked = false});


static List<Produtos> preencher() { 
  List<Produtos> listaProdutos = [];

  listaProdutos.add(Produtos(nomeProduto: 'Goiaba', quantidade: 2));
  listaProdutos.add(Produtos(nomeProduto: 'Açucar', quantidade: 4));

  return listaProdutos;

}


}