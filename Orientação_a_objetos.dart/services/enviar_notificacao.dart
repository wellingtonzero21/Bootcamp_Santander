import '../enum/tipo_notificacao.dart';
import '../pessoa_classe_e_encapsulamento.dart';
import 'notificacaoSMS.dart';
import 'notificacao_ interface.dart';
import 'notificacao_email.dart';
import 'notificacao_push.dart';

class EnviarNotificacao {
  NotificacaoInterface? notificacao;

  void notificar(Pessoa pessoa) {
    switch (pessoa.getTipoNotificacao()) {
      case TipoNotificacao.EMAIL :
        notificacao = NotificacaoEmail();;
        break;
      case TipoNotificacao.PUSH_NOTIFICATION :
        notificacao = NotificacaoPush();
        break;
      case TipoNotificacao.SMS :
        notificacao = NotificacaoSMS();
        break;
      default: print("Pessoa sem notificação");
        break;
    }
    notificacao!.enviarNotificacao(pessoa);
  }
}