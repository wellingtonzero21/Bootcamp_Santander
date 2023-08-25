import 'enum/tipo_notificacao.dart';
import 'pessoa_classe_e_encapsulamento.dart';

class PessoaJuridica extends Pessoa {
  String _cnpj = "";

  PessoaJuridica(String nome, String endereco, String cnpj, {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      : super(nome, endereco, tipoNotificacao: tipoNotificacao) {
    _cnpj = cnpj;
  }

  void setCnpj(String cnpj) {
    _cnpj = cnpj;
  }

  String getCnpj() {
    return _cnpj;
  }

  @override
  String toString() {
    return {
      "Tipo": "PJ",
      "Nome": super.getNome(),
      "Endereço": super.getEndereco(),
      "TipoNotificacao" : super.getTipoNotificacao(),
      "CNPJ": _cnpj
    }.toString();
  }
}
