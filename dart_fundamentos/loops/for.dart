void main(List<String> args) {
  for (var i = 0; i <= 11; ++i) {
    print(i);
  }

  var texto = "Bootcamp DIO";
  for (var i = 0; i < texto.length; i++) {
    print(texto[i]);
  }

  var listaMomes = [
    "Danilo",
    "Roberto Carlos",
    "Vanderlei",
  ];
  for (var i = 0; i < listaMomes.length; i++) {
    print(listaMomes[i]);
  }

  var numeros = [1, 3, 6, 9, 12];
  var acumulador = 0;
  for (var numero in numeros) {
    acumulador = acumulador + numero;
    print(acumulador);
  }

  var letras = ["D", "I", "O"];
  for (var letras in letras) {
    print(letras);
  }

  /// ou ///
  letras.forEach((element) {
    print(element);
  });
}
