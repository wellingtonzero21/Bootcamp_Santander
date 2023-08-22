  import 'dart:io';

void main(List<String> args) {
  print("Bem vindo a calculadora :D");
  print("Digite um numero: ");
  var linha = stdin.readLineSync();
  var numero = double.parse(linha ?? "0");

  print("Digite outro numero: ");
  var linha2 = stdin.readLineSync();
  var numero2 = double.parse(linha2 ?? "0");

  print("Digite um operador matemático: (+, -, *, /)");
  var operador = stdin.readLineSync();

  double resultado = 0;

  switch(operador){
    case "+":
      resultado = numero + numero2;
      break;
    case "-":
      resultado = numero - numero2;
      break;
    case "*":
      resultado = numero * numero2;
      break;
    case "/":
      resultado = numero / numero2;
      break;
      default: print("Operação inválida");

  }
  print("O resultado da operação é: $resultado");
}
