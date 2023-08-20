void main(List<String> args) {
  double  numero = 10.9;
  var numero1 = 11.1;

  print('Remove ponto flutuante');
  print(numero.truncate());
  print(numero1.truncate());

  print('Arredondar para número inteiro');
  print(numero.toInt());
  print(numero1.toInt());

  print('Arredondar para cima');
  print(numero.ceil());
  print(numero1.ceil());

  print('Arredondar para baixo');
  print(numero.floor());
  print(numero1.floor());

  print('Retornar se o numero NÃO é um número valido');
  print(numero.isNaN);
  print(numero1.isNaN);

  print('Retornar se o número é negativo');
  print(numero.isNegative);
  print(numero1.isNegative);

  print('Retornar se o número é negativo');
  print(numero.isNegative);
  print((numero1 * -1).isNegative);

  print('Converter String para double');
  print(double.parse("10"));
  //print(double.parse("teste"));
  print(double.tryParse("teste"));

}