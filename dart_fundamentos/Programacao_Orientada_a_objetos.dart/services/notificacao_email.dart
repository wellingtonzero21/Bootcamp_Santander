import '../pessoa_classe_e_encapsulamento.dart';
import 'notificacao_ interface.dart';

class NotificacaoEmail implements NotificacaoInterface {
  @override
  void enviarNotificacao(Pessoa pessoa) {
    print("enviando Email para: ${pessoa.getNome()}");
  }
}