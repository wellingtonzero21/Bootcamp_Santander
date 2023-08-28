import 'dart:io';
import 'dart:math';

import 'package:fundamentos_dart/exception/nome_invalido_exception.dart';
import 'package:fundamentos_dart/model/class_aluno.dart';
import 'package:fundamentos_dart/model/console_utils.dart';

void execute() {
  print("Bem vindo ao Sistema de notas!");
  String nome = ConsoleUtils.lerStringComTexto("Digite o nome do Aluno: ");
    try {
      if (nome.trim() == "") {
      throw NomeInvalidoException();
    } 
    } catch (NomeInvalidoException) {
      print(NomeInvalidoException);
    } catch (e) {
      print(e);
    }

  var aluno = Aluno(nome);
  double? nota;

  do {
    nota = ConsoleUtils.lerDoubleComTextoComSaida(
        "Digite a nota ou S para sair", "S");
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);
  print("As notas digitadas foram ${aluno.getNotas()}");
  print("A média do aluno foi: ${aluno.retornaMedia()}");
  if (aluno.aprovado(7)) {
    print("O aluno: ${aluno.getNome()}foi aprovado");
    print(aluno.getNome());
  } else {
    print("O aluno: ${aluno.getNome()}foi reprovado");
  }
}
