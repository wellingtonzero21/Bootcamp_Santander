import 'package:flutter/material.dart';
import 'package:primeiro_app/repositories/linguagens_repository.dart';
import 'package:primeiro_app/repositories/nivel_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> linguagensSelecionadas = [];
  var linguagensRepository = LinguagensRepository();
  double salarioEscolhido = 0.0;
  int tempoDeExperiencia = 0;

  late SharedPreferences storage;
  final String CHAVE_DADOS_CADASTRAIS_NOME = "CHAVE_DADOS_CADASTRAIS_NOME";
  final String CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO =
      "CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO";
  final String CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA =
      "CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA";
  final String CHAVE_DADOS_CADASTRAIS_LINGUAGENS =
      "CHAVE_DADOS_CADASTRAIS_LINGUAGENS";
  final String CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA =
      "CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA";
  final String CHAVE_DADOS_CADASTRAIS_SALARIO =
      "CHAVE_DADOS_CADASTRAIS_SALARIO";

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagem();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    nomeController.text =
        storage.getString(CHAVE_DADOS_CADASTRAIS_NOME) ?? "";
    dataNascimentoController.text =
        storage.getString(CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO) ?? "";
        dataNascimento = DateTime.parse(dataNascimentoController.text);    nivelSelecionado =
        storage.getString(CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA) ?? "";
    linguagensSelecionadas =
        storage.getStringList(CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA) ?? [];
    tempoDeExperiencia =
        storage.getInt(CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA) ?? 0;
    salarioEscolhido = storage.getDouble(CHAVE_DADOS_CADASTRAIS_SALARIO) ?? 0;
    setState(() {});
  }

  List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(
        DropdownMenuItem(
          value: i,
          child: Text(i.toString()),
        ),
      );
    }
    return itens;
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
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
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
                            "Linguagens preferidas:",
                            style: TextStyle(fontSize: 19),
                          ),
                          Column(
                            children: linguagens
                                .map((linguagem) => CheckboxListTile(
                                    title: Text(linguagem),
                                    value: linguagensSelecionadas
                                        .contains(linguagem),
                                    onChanged: (bool? value) {
                                      if (value!) {
                                        linguagensSelecionadas.add(linguagem);
                                      } else {
                                        linguagensSelecionadas
                                            .remove(linguagem);
                                      }
                                      setState(() {});
                                    }))
                                .toList(),
                          )
                        ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tempo de experiência",
                            style: TextStyle(fontSize: 19),
                          ),
                        ]),
                  ),
                  DropdownButton(
                      isExpanded: true,
                      value: tempoDeExperiencia,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          tempoDeExperiencia = int.parse(value.toString());
                        });
                      }),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pretensão salárial: R\$ ${salarioEscolhido.round()}",
                            style: TextStyle(fontSize: 19),
                          ),
                          Slider(
                              min: 0,
                              max: 10000,
                              value: salarioEscolhido,
                              onChanged: (double value) {
                                setState(() {
                                  salarioEscolhido = value;
                                });
                              })
                        ]),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () async {
                          setState(() {
                            salvando = false;
                          });
                          if (nomeController.text.trim().length < 3) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Preencha o nome"),
                            ));
                            return;
                          }
                          if (dataNascimento == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Data de nascimento inválida"),
                            ));
                            return;
                          }
                          if (nivelSelecionado == "") {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Selecione o seu nivel"),
                            ));
                            return;
                          }
                          if (linguagensSelecionadas.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Selecione ao menos uma linguagem"),
                            ));
                            return;
                          }
                          if (salarioEscolhido <= 0) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretensão salarial precisa ser maior que 0"),
                            ));
                            return;
                          }

                          await storage.setString(
                              CHAVE_DADOS_CADASTRAIS_NOME, nomeController.text);
                          await storage.setString(
                              CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO,
                              dataNascimento.toString());
                          await storage.setString(
                              CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
                              nivelSelecionado);
                          await storage.setStringList(
                              CHAVE_DADOS_CADASTRAIS_LINGUAGENS,
                              linguagensSelecionadas);
                          await storage.setInt(
                              CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
                              tempoDeExperiencia);
                          await storage.setDouble(
                              CHAVE_DADOS_CADASTRAIS_SALARIO, salarioEscolhido);

                          setState(() {
                            salvando = true;
                          });
                          Future.delayed(const Duration(seconds: 3), () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Salvo com sucesso!")));
                            setState(() {
                              salvando = false;
                            });
                            Navigator.pop(context);
                          });
                        },
                        child: const Text("Salvar")),
                  ),
                ],
              ),
      ),
    );
  }
}
