import '../pessoa_classe_e_encapsulamento.dart';
import 'notificacao_ interface.dart';

class NotificacaoSMS implements NotificacaoInterface {

  @override
  void enviarNotificacao(Pessoa pessoa) {print("enviando SMS para: ${pessoa.getNome()}");
  }
}
