import 'package:fundamentos_dart/model/class_aluno.dart';
import 'package:fundamentos_dart/model/utils.dart';

void execute() {

  print("Bem vindo ao programa");
  var nome = ConsoleUtils.lerStringComTexto("Digite o nome do Aluno: ");

  var aluno = Aluno(nome);
}