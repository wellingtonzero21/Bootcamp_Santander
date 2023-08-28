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

  List<double> getNotas() {
    return _nota;
  }

  void adicionarNota(double nota) {
    _nota.add(nota);
  }

  double retornaMedia() {
    double totalNotas = 0.0;
    for (var nota in _nota) {
      totalNotas = totalNotas + nota;
    }
    var media = totalNotas / _nota.length;
    return media.isNaN ? 0 : media;
  }

  bool aprovado(double notaCorte) {
    return retornaMedia() >= notaCorte;
  }
}
