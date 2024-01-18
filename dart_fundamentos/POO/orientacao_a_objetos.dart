void main(List<String> args) {
  Carro mercedes = Carro('mercedes');
  Carro gol = Carro('gol');

  print(mercedes.modelo);
  print(mercedes.valorDoCarro);
  print(gol.modelo);
  print(gol.valorDoCarro);

  Pagamento pagamento = PagarComPix();
  pagamento.pagar();

  Pagamento pagamento2 = PagamentoComBoleto();
  pagamento2.pagar();
}

class Carro {
  final String modelo;
  int _fabricacao = 5000;
  int _valor = 10000;

  int get valorFabracacao => _fabricacao;

  set valorNovo(int valor) {
    _fabricacao = valor;
    }

  int get valorDoCarro => _valor;

  set value(int valor) {
    _valor = valor;
  }
  Carro(this.modelo);

}

abstract class Pessoa {
  String comunicar();
}

class PessoaET extends Pessoa {
  String comunicar() {
    return "Olá, mundo";
  }
}

class PessoaNaoET extends Pessoa {
  String comunicar() {
    return "Bom Dia";
  }
}

abstract class Pagamento {
  void pagar();
}

class PagarComPix implements Pagamento {
  void pagar() {
    return print("Pago com Pix");
  }
}

class PagamentoComBoleto implements Pagamento {
  @override
  void pagar() {
    return print("Pago com Boleto");
  }
}