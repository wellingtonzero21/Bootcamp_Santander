import '../pessoa_classe_e_encapsulamento.dart';
import 'notificacao_ interface.dart';

class NotificacaoPush implements NotificacaoInterface {
  @override
  void enviarNotificacao(Pessoa pessoa) {
    print("enviando Push para: ${pessoa.getNome()}");
  }
}