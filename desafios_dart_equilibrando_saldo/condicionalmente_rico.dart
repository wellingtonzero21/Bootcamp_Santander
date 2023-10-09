import 'dart:io';

void main() {
  // Entrada de dados
  int saldoTotal = int.parse(stdin.readLineSync()!);
  int valorSaque = int.parse(stdin.readLineSync()!);

  if (saldoTotal >= valorSaque) {
    saldoTotal = saldoTotal - valorSaque;
    print("Saque realizado com sucesso. Novo saldo: $saldoTotal");
  } else {
    print("Saldo insuficiente. Saque nao realizado!");
  }
}