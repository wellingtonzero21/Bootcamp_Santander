import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() =>
      _NumerosAleatoriosHivePageState();
}

class _NumerosAleatoriosHivePageState extends State<NumerosAleatoriosHivePage> {
  int? numeroGerado;
  int? quantidadeCliques;
  final CHAVE_NUMERO_ALEATORIO = "numero_aleatorio";
  final CHAVE_QUANTIDADE_CLIQUES = "quantidade_cliques";
  late Box boxNumerosAleatorios;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen("box_numeros_aleatorios")) {
      boxNumerosAleatorios = Hive.box("box_numeros_aleatorios");
    } else {
      boxNumerosAleatorios = await Hive.openBox("box_numeros_aleatorios");
    }

    numeroGerado = boxNumerosAleatorios.get("numeroGerado") ?? 0;
    quantidadeCliques = boxNumerosAleatorios.get("quantidadeCliques") ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hive"),
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
            setState(() {
              numeroGerado = random.nextInt(100);
              quantidadeCliques = (quantidadeCliques ?? 0) + 1;
            });
            boxNumerosAleatorios.put("numeroGerado", numeroGerado!);
            boxNumerosAleatorios.put("quantidadeCliques", quantidadeCliques!);
          },
        ),
      ),
    );
  }
}
