import 'dart:io';

String lerConsole(String texto) {
  print(texto);
  var line = stdin.readLineSync();
  return line ?? "";
}

double lerConsoleDouble(String texto) {
  var numero = double.tryParse(lerConsole(texto));
  if (numero == null) {
    print("Numero invalido, alterado para 0");
    return 0.0;
  } else {
    return numero;
  }
}
