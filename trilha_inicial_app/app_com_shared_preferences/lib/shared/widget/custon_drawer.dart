import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/configuracoes/configuracoes_hive_page.dart';
import 'package:primeiro_app/pages/dados_cadastrais.dart';
import 'package:primeiro_app/pages/login_page.dart';
import 'package:primeiro_app/pages/numeros_aleatorios/numeros_aleatorios_hive.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          leading: const Icon(Icons.camera),
                          title: const Text("Câmera"),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          leading: const Icon(Icons.photo),
                          title: const Text("Galeria"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: UserAccountsDrawerHeader(
                  decoration:
                      const BoxDecoration(color: Color.fromARGB(224, 0, 0, 0)),
                  currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.deepPurple[200],
                      child: Image.asset("assets/image/logo.png")),
                  accountName: const Text(
                    "Wellington",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                  accountEmail: Text("teste@email.com")),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DadosCadastrais(),
                    ));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Dados cadastráis",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      child: const Column(
                        children: [
                          Text(
                            "Termos de uso",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Termos de uso",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            InkWell(
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.numbers,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Gerador de números",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                debugPrint('Clicado');
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NumerosAleatoriosHivePage(),
                    ));
              },
            ),
            const Divider(),
            InkWell(
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Configuração",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfiguracoesHivePage(),
                    ));
              },
            ),
            const Divider(),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: Center(child: const Text("DIO_")),
                        content: const Wrap(
                          children: [
                            Text(
                              "Deseja realmente sair do aplicativo?",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Não")),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LoginPage(),
                                      ));
                                },
                                child: const Text("Sim")),
                          ),
                        ],
                      );
                    });
              },
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Sair",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
