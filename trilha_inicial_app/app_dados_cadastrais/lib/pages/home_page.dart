import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/dados_cadastrais.dart';
import 'package:primeiro_app/pages/page1.dart';

import 'page2.dart';
import 'page3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DadosCadastrais(),
                      ));
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15,),
                    child: Text(
                      "Dados cadastráis",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  debugPrint('Clicado');
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Termos de uso",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  debugPrint('Clicado');
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Configuração",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPagina = value;
                });
              },
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: const [
                BottomNavigationBarItem(label: "Add", icon: Icon(Icons.add)),
                BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "Person", icon: Icon(Icons.person)),
              ]),
        ],
      ),
    );
  }
}
