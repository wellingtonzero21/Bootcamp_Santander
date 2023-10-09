import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesSharedPreferencesPage extends StatefulWidget {
  const ConfiguracoesSharedPreferencesPage({super.key});

  @override
  State<ConfiguracoesSharedPreferencesPage> createState() => _ConfiguracoesSharedPreferencesPageState();
}

class _ConfiguracoesSharedPreferencesPageState extends State<ConfiguracoesSharedPreferencesPage> {
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool darkMode = false;

  late SharedPreferences storage;
  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA = "CHAVE_ALTURA";
  final CHAVE_RECEBER_NOTIFICACOES = "CHAVE_RECEBER_NOTIFICACOES";
  final CHAVE_DARK_MODE = "CHAVE_DARK_MODE";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
      receberNotificacoes =
          storage.getBool(CHAVE_RECEBER_NOTIFICACOES) ?? false;
      darkMode = storage.getBool(CHAVE_DARK_MODE) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
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
              value: receberNotificacoes,
              onChanged: (bool value) {
                setState(() {
                  receberNotificacoes = !receberNotificacoes;
                });
              },
            ),
            SwitchListTile(
              title: const Text("Tema Escuro", style: TextStyle(fontSize: 20)),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = !darkMode;
                });
              },
            ),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setDouble(
                        CHAVE_ALTURA, double.parse(alturaController.text));
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
                  await storage.setString(
                      CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                  await storage.setBool(
                      CHAVE_RECEBER_NOTIFICACOES, receberNotificacoes);
                  await storage.setBool(CHAVE_DARK_MODE, darkMode);
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
