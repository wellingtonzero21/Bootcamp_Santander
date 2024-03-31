import 'dart:io';

void main() {
  double valor = double.parse(stdin.readLineSync()!);

  if (valor > 0) {
    //TODO: Imprimir a mensagem de sucesso, formatando o saldo atual (vide Exemplos).
    var valorFormatado = valor.toStringAsFixed(2);
    print("Deposito realizado com sucesso!");
    print("Saldo atual: R\$ $valorFormatado");
  } else if (valor == 0) {
    //TODO: Imprimir a mensagem de valor inválido.
    print("Encerrando o programa...");
  } else {
    //TODO: Imprimir a mensagem de encerrar o programa.

    print("Valor invalido! Digite um valor maior que zero.");
  }
}
