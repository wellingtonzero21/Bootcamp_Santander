import 'package:flutter/material.dart';
import 'package:primeiro_app/model/configuracoes_model.dart';
import 'package:primeiro_app/repositories/configuracoes_repositiry.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  var configuracoesModel = ConfiguracoesModel.vazio();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações Hive"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Nome do usuário",
                ),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Altura",
                ),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
              title: const Text(
                "Receber Notificações",
                style: TextStyle(fontSize: 20),
              ),
              onChanged: (bool value) {
                setState(() {
                  configuracoesModel.receberNotificacoes = value;
                });
              },
              value: configuracoesModel.receberNotificacoes,
            ),
            SwitchListTile(
              title: const Text("Tema Escuro", style: TextStyle(fontSize: 20)),
              onChanged: (value) {
                setState(() {
                  configuracoesModel.darkMode = value;
                });
              },
              value: configuracoesModel.darkMode,
            ),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    configuracoesModel.altura =
                        double.parse(alturaController.text);
                  } catch (e) {
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Meu App"),
                          content: const Text(
                              "Por favor informe uma altura válida!"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"))
                          ],
                        );
                      },
                    );
                    return;
                  }
                  configuracoesModel.nomeUsuario = nomeUsuarioController.text;
                  configuracoesRepository.salvar(configuracoesModel);
                  Navigator.pop(context);
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
