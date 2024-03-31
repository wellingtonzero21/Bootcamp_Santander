/*void main(List<String> args) {
  var contador = 0;
  var total = 10;
  while (contador < total) {
    contador = contador +1;
    print(contador);
  }
}*/

import 'dart:io';

void main(List<String> args) {
  print("Digite um número ou escreva S para sair");
  var linha = stdin.readLineSync();
  double acumulador = 0;

  while (linha != "S") {
    var numero = double.parse(linha ?? "");
    acumulador = numero + acumulador;
    print("Digite um número ou escreva S para sair");
    linha = stdin.readLineSync();
  }
  print("A Soma total é de : $acumulador");
}
