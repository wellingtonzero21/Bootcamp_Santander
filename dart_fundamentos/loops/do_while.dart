import 'dart:io';

void main(List<String> args) {
  var opcao = "";
  double acumulador = 0;
  do {
    print("digite um número ou S para SAIR");
    var linha = stdin.readLineSync();
    opcao = linha ?? "";
    var numero = double.tryParse(opcao);
    if (numero != null) {
      acumulador = acumulador + numero;
    }
  } while (opcao != "S");
  print(acumulador);
}
