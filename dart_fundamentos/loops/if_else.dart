//if , else , else if
import 'dart:io';

void main(List<String> args) {
  print("Digite a nota da primeira prova: ");
  var linha = stdin.readLineSync();
  var prova1 = int.parse(linha ?? "0");

  print("Digite o numero da segunda prova: ");
  var linha2 = stdin.readLineSync();
  var prova2 = int.parse(linha2 ?? "0");

  var media = (prova1 + prova2) / 2;

  if (media >= 7) {
    print("Aprovado com a nota: $media");
  } else if (media >= 5) {
    print("pazer recuperação! Média: $media");
  } else {
    print("Reprovado! Média: $media");
  }

  // if ternário

  var resultado = (media >= 7 ? "Aprovado" : "Reprovado");
  print(resultado);
}
