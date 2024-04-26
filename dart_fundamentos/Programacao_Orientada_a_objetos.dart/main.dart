import 'enum/tipo_notificacao.dart';
import 'pessoa_fisica.dart';
import 'pessoa_juridica.dart';
import 'services/enviar_notificacao.dart';

void main(List<String> args) {

  var pessoaJuridica = new PessoaJuridica("Rodolfo", "Rua do bobo, Numero 0", "123858298946484",
    tipoNotificacao : TipoNotificacao.EMAIL);
    print(pessoaJuridica);

  var pessoaFisica = PessoaFisica("Jacinto", "Guaratiba", "012.345.678-91",
    tipoNotificacao: TipoNotificacao.SMS);
    print(pessoaFisica);

  EnviarNotificacao enviarNotificacao = EnviarNotificacao();
  enviarNotificacao.notificar(pessoaFisica);
  enviarNotificacao.notificar(pessoaJuridica);
}