void main(List<String> args) {
  Celular celularDavid = Celular('Azul', 5, 6.7, 0.800);
  Celular celularZe = Celular('Preto', 3, 6.7, 0.700);
  print(celularDavid.toString());
  print(celularZe.toString());
  print(celularDavid.valorCelular(500));
  print(celularZe.valorCelular(500));
}

class Celular {
  final String cor;
  final int processadores;
  final double tamanho;
  final double peso;

  Celular(this.cor, this.processadores, this.tamanho, this.peso);

  String toString() {
    return "Cor $cor, processadores $processadores, tamanho $tamanho, peso $peso";
  }

  double valorCelular(double valor) {
    return valor * processadores;
  }
}
