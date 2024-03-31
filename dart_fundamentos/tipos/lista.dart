void main(List<String> args) {
  List<String> listaString = [];
  var listaInt = [1, 10, 50];
  List listaDynamic = [];

  print("Tamanho da Lista");
  print(listaString.length);
  print(listaInt.length);
  print(listaDynamic.length);

  print("Add intens");
  listaString.add('Maria, Jõao, Lurdes e Evanderaldonilsson');
  listaInt.add(6);
  listaDynamic.add(3);
  listaDynamic.add("a");
  listaDynamic.add(true);
  print(listaString);
  print(listaInt);
  print(listaDynamic);

  print("Contem na lista?");
  print(listaString.contains("Maria"));
  print(listaInt.contains(6));
  print(listaDynamic.contains(false));

  print("Função where");
  print(listaInt);
  print(listaInt.where((x) => x >= 6 && x <= 25));
}
