import 'package:flutter/material.dart';
import 'package:primeiro_app/repositories/linguagens_repository.dart';
import 'package:primeiro_app/repositories/nivel_repository.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";
  var linguagens = [];
  var linguagensSelecionadas = [];
  var linguagensRepository = LinguagensRepository();

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meus dados",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        child: ListView(
          children: [
            const Text(
              "Nome:",
              style: TextStyle(fontSize: 19),
            ),
            SizedBox(
              height: 30,
              child: TextField(
                controller: nomeController,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data de Nascimento:",
                      style: TextStyle(fontSize: 19),
                    ),
                  ]),
            ),
            SizedBox(
              height: 30,
              child: TextField(
                controller: dataNascimentoController,
                readOnly: true,
                onTap: () async {
                  var data = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000, 01, 01),
                      firstDate: DateTime(1900, 01, 01),
                      lastDate: DateTime(2023, 01, 01));
                  if (data != null) {
                    dataNascimentoController.text = data.toString();
                    dataNascimento = data;
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nível de experiência:",
                      style: TextStyle(fontSize: 19),
                    ),
                  ]),
            ),
            Column(
              children: niveis
                  .map((nivel) => RadioListTile(
                      title: Text(nivel.toString()),
                      selected: nivelSelecionado == nivel,
                      value: nivel.toString(),
                      groupValue: nivelSelecionado,
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          nivelSelecionado = value.toString();
                        });
                      }))
                  .toList(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Linguagem Preferidas:",
                      style: TextStyle(fontSize: 19),
                    ),
                    Column(
                      children: linguagens
                          .map((linguagem) => CheckboxListTile(
                              title: Text(linguagem),
                              value: linguagensSelecionadas.contains(linguagem),
                              onChanged: (bool? value) {
                                  if (value!) {
                                    linguagensSelecionadas.add(linguagem);
                                  } else {
                                    linguagensSelecionadas.remove(linguagem);
                                  }
                                  setState(() {
                                    
                                  });
                              }))
                          .toList(),
                    )
                  ]),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    print("Clicado");
                  },
                  child: const Text("Salvar")),
            ),
          ],
        ),
      ),
    );
  }
}
