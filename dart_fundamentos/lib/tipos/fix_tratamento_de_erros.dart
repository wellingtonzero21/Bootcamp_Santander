void main(List<String> args) {
  UserError login = UserError();

  try {
    login.logar();
  } on passwordLengthError catch (e) {
    print("Falhou ao logar");
  } catch (e) {
    print("Outro erro");
  }
}

class UserError {
  logar() {
    String user = "admin";
    String password = "123";

    if (password.length <= 6) throw Exception();
  }
}

class passwordLengthError implements Exception {
  passwordLengthError();
}