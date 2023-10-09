import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosSharedPreferencesPage extends StatefulWidget {
  const NumerosAleatoriosSharedPreferencesPage({super.key});

  @override
  State<NumerosAleatoriosSharedPreferencesPage> createState() => _NumerosAleatoriosSharedPreferencesPageState();
}

class _NumerosAleatoriosSharedPreferencesPageState extends State<NumerosAleatoriosSharedPreferencesPage> {
  int? numeroGerado;
  int? quantidadeCliques;
  final CHAVE_NUMERO_ALEATORIO = "numero_aleatorio";
  final CHAVE_QUANTIDADE_CLIQUES = "quantidade_cliques";
  late SharedPreferences storage;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(CHAVE_NUMERO_ALEATORIO);
      quantidadeCliques = storage.getInt(CHAVE_QUANTIDADE_CLIQUES);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gerador de números Aleatórios"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quantidadeCliques == null
                    ? "Nenhum clique efetuado"
                    : quantidadeCliques.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                numeroGerado == null ? "0" : numeroGerado.toString(),
                style: const TextStyle(fontSize: 45),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();
            storage = await SharedPreferences.getInstance();
            setState(() {
              numeroGerado = random.nextInt(100);
              quantidadeCliques = (quantidadeCliques ?? 0) + 1;
            });
            storage.setInt(CHAVE_NUMERO_ALEATORIO, numeroGerado!);
            storage.setInt(CHAVE_QUANTIDADE_CLIQUES, quantidadeCliques!);
          },
        ),
      ),
    );
  }
}
