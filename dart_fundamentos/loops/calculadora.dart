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

  ///////// if/ else if/ else \\\\\\\\\\\

  /*if(operador == "+" ) {
    var soma = numero + numero2;
    print("a soma entre $numero e $numero2 é: $soma");
  } else if(operador == "-" ) {
      var subtracao = numero - numero2;
      print("A subtração entre $numero e $numero2 é: $subtracao");
  } else if(operador == "*" ) {
      var vezes = numero * numero2;
      print("A multiplicação entre $numero e $numero2 é: $vezes");
  } else if(operador == "/" ) {
      var divisao = numero / numero2;
      print("A divisão entre o numero $numero e $numero2 é: $divisao");
  } else {print("Não entendemos seu operador"); exit(0);}*/

  ///////// Switch \\\\\\\\\\\

  double resultado = 0;

  switch (operador) {
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
    default:
      print("Operação inválida");
  }
  print("O resultado da operação é: $resultado");
}
