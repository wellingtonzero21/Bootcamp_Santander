void main(List<String> args) {
  try {
    print((2 / 0).toInt());
  } catch (e, stackStrace) {
    print("printando o erro $e");
    //rethrow; //propagar o erro
    //throw Exception("Ocorreu um erro xpto"); //retornar um novo erro
    throw CustomError("Erro Customizado");
  }
}

class CustomError implements Exception {
  final String error;
  CustomError(this.error);
}