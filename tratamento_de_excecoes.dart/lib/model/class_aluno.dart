class Aluno {
  String _nome = "";
  final List<double> _nota = [];

  Aluno(String nome);

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void adicionarNota(double nota) {
    _nota.add(nota);
  }
}