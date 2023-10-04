calcularIMC(double peso, double altura) {
  double imc = peso / (altura * altura);
    return imc;
}

textoSituacao(double resultado) {
  if (resultado < 16.0) {
    return "Magreza Grave";
  } else if (resultado >= 16 && resultado < 17) {
    return "Magreza Moderada";
  } else if (resultado >= 17 && resultado < 18.5) {
    return "Magreza Leve";
  } else if (resultado >= 18.5 && resultado < 25) {
    return "Saudável";
  } else if (resultado >= 25 && resultado < 30) {
    return "Sobrepeso";
  } else if (resultado >= 30 && resultado < 35) {
    return "Obesidade Grau I";
  } else if (resultado >= 35 && resultado < 40) {
    return "Obesidade Grau II (severa)";
  } else if (resultado >= 40) {
    return "Obesidade Grau III (mórbida)";
  }

}