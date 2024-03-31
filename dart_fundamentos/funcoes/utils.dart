import 'dart:io';

String lerConsole(String texto) {
  print(texto);
  var linha = stdin.readLineSync();
  return linha ?? "";
}

double lerConsoleDouble(String texto) {
  var numero = double.tryParse(lerConsole(texto));
  if (numero == null) {
    print("Não foi digitado um numero, alterado para 0");
    return 0.0;
  } else {
    return numero;
  }
}

double soma(double numero, double numero2) {
  return numero + numero2;
}

double somaLista(List<double> numeros) {
  double acumulador = 0;
  for (var numero in numeros) {
    acumulador = soma(acumulador, numero);
  }
  return acumulador;
}

double subtracao(double numero, double numero2) {
  return numero - numero2;
}

double multiplicacao(double numero, double numero2) {
  return numero * numero2;
}

double divisao(double numero, double numero2) {
  if (numero2 == 0) {
    print("Não é possivel dividir por 0");
    return 0;
  } else {
    return numero / numero2;
  }
}
