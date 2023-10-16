import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primeiro_app/service/gerador_numero_aleatorio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
                "Ações do Usuário",
                style: GoogleFonts.akshar(fontSize: 20),
              )),
          Center(
              child: Text(
                "Numero Aleatório: $numeroGerado",
                style: GoogleFonts.akshar(fontSize: 20),
              )),
          Center(
              child: Text(
                "Quantidade de Cliques: $quantidadeCliques",
                style: GoogleFonts.akshar(fontSize: 20),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              quantidadeCliques = quantidadeCliques +1;
              print(quantidadeCliques);
              numeroGerado =
                  GeradorNumeroAleatorioService.gerarNumeroAleatorio(11);
              print(numeroGerado);
            });
          }),
    );
  }
}
