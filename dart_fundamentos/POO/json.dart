import 'dart:convert';

void main(List<String> args) {
  String json = '''
  {
    "user": "user@gmail.com",
    "password": "123456",
    "permissoes": [
        "ower",
        "admin"
    ]
}
''';

  print(json);

  Map resultJson = jsonDecode(json);
  print(resultJson);
  print(resultJson.runtimeType);
  print(resultJson["user"]);
  print(resultJson["password"]);
  print(resultJson["permissoes"][0]);

  Map mapa = {
    'nome': 'David',
    'password': '123456',
    'permissoes': ["owner", "admin"],
  };
  print("-------------------------");
  print(mapa);

  var result = jsonEncode(mapa);
  print(result);
}
