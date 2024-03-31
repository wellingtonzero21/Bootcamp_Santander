void main(List<String> args) {
  Map<String, dynamic> map1 = <String, dynamic>{};
  var map2 = {"Maria": 22, "José": 20, "Evanderaldonilsson": 85};
  print(map1);
  print(map2);

  print("Obtem valor pela chave");
  print(map2["Maria"]);

  print("Add itens");
  map2.addAll({"Marcos": 18});
  print(map2);

  print("Está vazio");
  print(map1.isEmpty);
  print(map1.isNotEmpty);

  print("Quantidade de itens");
  print(map2.length);

  print("Contem chave");
  print(map2.containsKey("Maria"));
  print(map2.containsKey("Fábio"));

  //---------------------------------------

  map1.addAll({
    "Nome": "Manoel Gomes",
    "Idade": 40,
    "Casado": true,
  });
  print(map1);
  print(map1["Idade"]);
}
