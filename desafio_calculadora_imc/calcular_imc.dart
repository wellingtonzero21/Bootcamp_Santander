void calcularIMC(double peso, double altura) {
  double imc = peso / (altura * altura);

  if (imc < 18.6) {
    print('Abaixo do Peso! $peso');
  } else if (imc >= 18.6 && imc < 24.9) {
    print("Peso Ideal! $peso");
  } else if (imc >= 24.9 && imc < 29.9) {
    print("Levemente Acima do Peso! $peso");
  } else if (imc >= 29.9 && imc < 34.9) {
    print("Obesidade Grau I! $peso");
  } else if (imc >= 34.9 && imc < 39.9) {
    print("Obesidade Grau II! $peso");
  } else if (imc >= 40) {
    print("Obesidade Grau III! $peso");
  }
  print("seu IMC: $imc");
}
