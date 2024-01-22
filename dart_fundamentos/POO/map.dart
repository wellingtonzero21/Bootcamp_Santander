void main(List<String> args) {
  List<String> lista = ['David','Henrique'];
  print(lista[1]);

  Map<String, String> mapa ={'Chave' : 'Valor'};
  print(mapa);
  //print(mapa['Chave']);

  mapa.putIfAbsent('novaChave', () => 'novoValor');
  print(mapa);

  mapa['novaChaveDois'] = 'novoValorDois';
  print(mapa);

  mapa.remove('Chave');
  print(mapa);
  
  mapa['novoValorDois'] = 'atualizado';
  print(mapa);

  mapa.update('novaChaveDois', (value) => 'atualizado2');
  print(mapa);

  mapa.forEach((key, value) {print('a Chave é: $key e valor é: $value');});

  mapa.keys.forEach(print);
  mapa.values.forEach(print);
}