import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/card_page.dart';
import 'package:primeiro_app/pages/list_view_h.dart';
import 'package:primeiro_app/pages/tarefa_page/tarefa_sqlite_page.dart';
import 'package:primeiro_app/pages/consulta_cep.dart';
import 'package:primeiro_app/shared/widget/custon_drawer.dart';

import 'image_assets.dart';
import 'list_view_v.dart';

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
      drawer: const CustomDrawer(),
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
                ConsultaCEP(),
                CArdPage(),
                ImageAssetsPage(),
                ListViewVPage(),
                ListViewHPage(),
                TarefaSQLitePage(),
              ],
            ),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: const [
                BottomNavigationBarItem(label: "HTTP", icon: Icon(Icons.get_app_rounded)),
                BottomNavigationBarItem(label: "Add", icon: Icon(Icons.add)),
                BottomNavigationBarItem(label: "outros", icon: Icon(Icons.account_box)),
                BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "Person", icon: Icon(Icons.person)),
                BottomNavigationBarItem(label: "Tarefas", icon: Icon(Icons.list)),
              ]),
        ],
      ),
    );
  }
}
