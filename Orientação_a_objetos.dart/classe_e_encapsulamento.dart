class Pessoa {
  String _nome = "";
  String _endereco = "";

  Pessoa(nome, endereco) {
    _nome = nome;
    _endereco = endereco;
  }

  void setNome(String nome) {
    _nome = nome;
  }


  void setEndereco(String endereco) {
    _endereco = endereco;
  }

  String getNome() {
    return _nome;
  }
  String getendereco() {
    return _endereco;
  }

  @override
  String toString() {
    return {
      "Nome" : _nome,
      "Endereco" : _endereco,
    }.toString();
  }
}
