import 'utils.dart' as utils;

void main(List<String> args) {
  var linha = utils.lerConsole("Digite um numero ou S para sair: ");
  List<double> numeros = [];
  while (linha != "S") {
    numeros.add(double.parse(linha));
    linha = utils.lerConsole("Digite um numero ou S para sair: ");
  }
  print(utils.somaLista(numeros));
}
