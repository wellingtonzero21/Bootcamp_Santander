void main(List<String> args) {
  print(celular1.nome);
  print(celular1.processadores);
  print(celular1.tamanho);
  print(celular1.peso);
}

var celular1 = Celular('Nokia', 5, 6.7, 0.800);

class Celular {
  final String nome;
  final int processadores;
  final double tamanho;
  final double peso;

  Celular(this.nome, this.processadores, this.tamanho, this.peso);
}

