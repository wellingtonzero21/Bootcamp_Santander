import 'package:flutter/material.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  @override
  Widget build(BuildContext context) {
    var nomeController = TextEditingController(text: "");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus dados", style: TextStyle(fontSize: 22,),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nome",
              style: TextStyle(fontSize: 22),
            ),
            TextField(
              controller: nomeController,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: () {
                print("Clicado");
              },
              child: Text("Salvar")),
            ),
          ],
        ),
      ),
    );
  }
}
