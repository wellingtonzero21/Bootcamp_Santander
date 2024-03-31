import 'utils.dart' as utils;

void main(List<String> args) {
  print("Bem vindo a calculadora :D");
  var numero = utils.lerConsoleDouble("Digite um numero: ");

  var numero2 = utils.lerConsoleDouble("Digite outro numero: ");

  var operador =
      utils.lerConsole("Digite um operador matemático: (+, -, *, /)");
  calcular(operador, numero, numero2);
}

void calcular(String operador, double numero, double numero2) {
  double resultado = 0;

  switch (operador) {
    case "+":
      resultado = utils.soma(numero, numero2);
      break;
    case "-":
      resultado = utils.subtracao(numero, numero2);
      break;
    case "*":
      resultado = utils.multiplicacao(numero, numero2);
      break;
    case "/":
      resultado = utils.divisao(numero, numero2);
      break;
    default:
      print("Operação inválida");
  }
  print("O resultado da operação é: $resultado");
}
