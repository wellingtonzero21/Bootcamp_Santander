import 'excessoes/tratamento_exceções.dart';
import 'pessoa.dart';
import 'utils.dart' as utils;

import 'calcular_imc.dart';

void main(List<String> args) {
  print("Bem vindo a calculadora de IMC");
  var nome = utils.lerConsole("Digite seu nome: ");
  try {
    if (nome.trim() == "") {
      throw NomeInvalido();
    }
  } on NomeInvalido {
    print(NomeInvalido());
  } catch (e) {
    print(e);
  }
  var peso = utils.lerConsoleDouble("Digite seu peso");
  var altura = utils.lerConsoleDouble("Digite sua altura: ");
  calcularIMC(peso, altura);

  Pessoa pessoa = Pessoa(nome, peso, altura);
  print(pessoa);
}
