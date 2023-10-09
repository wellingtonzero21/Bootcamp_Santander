import 'package:flutter/material.dart';
import 'package:primeiro_app/model/dados_cadastrais_model.dart';
import 'package:primeiro_app/repositories/dados_cadastrais_repository.dart';
import 'package:primeiro_app/repositories/linguagens_repository.dart';
import 'package:primeiro_app/repositories/nivel_repository.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  var dadosCadastraisModel = DadosCadastraisModel.vazio();
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  var nivelRepository = NivelRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensRepository = LinguagensRepository();

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagem();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento.toString();
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
                          dadosCadastraisModel.dataNascimento = data;
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
                            selected: dadosCadastraisModel.nivelExperiencia == nivel,
                            value: nivel.toString(),
                            groupValue: dadosCadastraisModel.nivelExperiencia,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                dadosCadastraisModel.nivelExperiencia = value.toString();
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
                                    value: dadosCadastraisModel.linguagens
                                        .contains(linguagem),
                                    onChanged: (bool? value) {
                                      if (value!) {
                                        dadosCadastraisModel.linguagens.add(linguagem);
                                      } else {
                                        dadosCadastraisModel.linguagens
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
                      value: dadosCadastraisModel.tempoDeExperiencia,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          dadosCadastraisModel.tempoDeExperiencia = int.parse(value.toString());
                        });
                      }),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pretensão salárial: R\$ ${dadosCadastraisModel.salario?.round()}",
                            style: TextStyle(fontSize: 19),
                          ),
                          Slider(
                              min: 0,
                              max: 10000,
                              value: dadosCadastraisModel.salario ?? 0,
                              onChanged: (double value) {
                                setState(() {
                                  dadosCadastraisModel.salario = value;
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
                          if (dadosCadastraisModel.dataNascimento == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Data de nascimento inválida"),
                            ));
                            return;
                          }
                          if (dadosCadastraisModel.nivelExperiencia == null || dadosCadastraisModel.nivelExperiencia!.trim() == "") {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Selecione o seu nivel"),
                            ));
                            return;
                          }
                          if (dadosCadastraisModel.linguagens.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Selecione ao menos uma linguagem"),
                            ));
                            return;
                          }
                          if (dadosCadastraisModel.salario == null || dadosCadastraisModel.salario == 0) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "A pretensão salarial precisa ser maior que 0"),
                            ));
                            return;
                          }
                          dadosCadastraisModel.nome = nomeController.text;
                          dadosCadastraisRepository.salvar(dadosCadastraisModel);
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
