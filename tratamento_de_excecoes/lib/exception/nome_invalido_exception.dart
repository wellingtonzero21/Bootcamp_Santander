class NomeInvalidoException implements Exception {
  String error() => "Nome invalido";
  @override
  String toString() {
    return "nomeInvalidoException: ${error()}";
  }
}
