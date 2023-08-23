import 'package:fundamentos_dart/functions/utils.dart' as utils;

void main(List<String> args) {
  var linha = utils.lerConsole("Digite um numero ou S para sair: ");
  double acumulador = 0;
  List<double> numeros = [];
  while(linha != "S") {
    numeros.add(double.parse(linha));
    linha = utils.lerConsole("Digite um numero ou S para sair: ");
  }
  print(utils.somaLista(numeros));
}

