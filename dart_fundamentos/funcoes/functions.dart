void main(List<String> args) {
  name("Wellington");
  idade();

  var resultado = sum(10, 5);
  print(resultado);

  var resultado2 = sum(10, 50);
  print(resultado2);

  var resultado3 = sum(10, 200);
  print(resultado3);
}

//void
void name(String name) {
  print("My name is $name");
}

//return
idade() {
  int years = 20;
  print("I have $years years");
  return years;
}

sum(int number1, int number2) {
  return number1 + number2;
}
