import 'enum/tipo_notificacao.dart';
import 'pessoa_classe_e_encapsulamento.dart';

class PessoaFisica extends Pessoa {
  String _cpf = "";

  PessoaFisica(String nome, String endereco, String cpf, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      : super(nome, endereco, tipoNotificacao: tipoNotificacao) {
    _cpf = cpf;
  }

  void setCpf(String cpf) {
    _cpf = cpf;
  }

  String getCpf() {
    return _cpf;
  }

  @override
  String toString() {
    return {
      "Tipo": "PF",
      "Nome": super.getNome(),
      "Endereço": super.getEndereco(),
      "TipoNotificacao" : super.getTipoNotificacao(),
      "CPF": _cpf
    }.toString();
  }
}
