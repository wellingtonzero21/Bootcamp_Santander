import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(224, 0, 0, 0)),
                currentAccountPicture:
                    CircleAvatar(
                      backgroundColor: Colors.deepPurple[200],
                      child: Image.asset("assets/image/logo.png")),
                accountName: Text("Wellington", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                accountEmail: Text("teste@email.com")),
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
                    Icon(Icons.person, size: 20,),
                    SizedBox(width: 5,),
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
                debugPrint('Clicado');
              },
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, size: 20,),
                      SizedBox(width: 5,),
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
              onTap: () {
                debugPrint('Clicado');
              },
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    children: [
                      Icon(Icons.settings, size: 20,),
                      SizedBox(width: 5),
                      Text(
                        "Configuração",
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
