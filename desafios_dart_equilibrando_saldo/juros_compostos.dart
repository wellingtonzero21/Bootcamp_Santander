import 'dart:io';

void main() {
  var valorInicial = double.parse(stdin.readLineSync()!);
  var taxaJuros = double.parse(stdin.readLineSync()!);
  var periodo = int.parse(stdin.readLineSync()!);

  var valorFinal = valorInicial;

  //TODO: Iterar, baseado no período em anos, para calculo do valorFinal com os juros.
  for (var anos = 1; anos <= periodo; anos++) {
    valorFinal += valorFinal * (taxaJuros);
  }
  var valorFinalFormatado = valorFinal.toStringAsFixed(2);

  print("Valor final do investimento: R\$ $valorFinalFormatado");
}
