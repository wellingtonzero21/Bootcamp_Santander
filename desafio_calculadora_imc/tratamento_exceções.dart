class NomeInvalido implements Exception {
  String error() => "Nome inválido!";
  @override
  String toString() {
    return "NomeInvalidoExeption: ${error()}";
  }
}