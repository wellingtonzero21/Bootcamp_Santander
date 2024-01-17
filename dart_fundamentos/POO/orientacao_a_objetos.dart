void main(List<String> args) {
  Carro mercedes = Carro('mercedes');
  Carro gol = Carro('gol');

  print(mercedes.modelo);
  print(mercedes._fabricacao);
  print(mercedes.valorDoCarro);
  print(gol.modelo);
  print(gol._fabricacao);
}

class Carro {
  final String modelo;
  Carro(this.modelo);
  int _valor = 10000;
  int _fabricacao = 5000;

  int get valorFabracacao => _fabricacao;

  set valorNovo(int valor) {
    _fabricacao = valor;
    }



  int get valorDoCarro => _valor;

  void set value(int valor) {
    _valor = valor;
  }
}
