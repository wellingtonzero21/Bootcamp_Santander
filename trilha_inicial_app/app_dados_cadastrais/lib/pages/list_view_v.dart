import 'package:flutter/material.dart';

class ListViewVPage extends StatelessWidget {
  const ListViewVPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset("assets/image/user1.png"),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fernanda"),
              Text("10:25"),
            ],
          ),
          subtitle: Text("Olá! tudo bem?"),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {

            },
            itemBuilder: (context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(value: "opcao1", child: Text("Opção 1")),
                PopupMenuItem<String>(value: "opcao2", child: Text("Opção 2")),
                PopupMenuItem<String>(value: "opcao3", child: Text("Opção 3")),
              ];
            },
          ),
          isThreeLine: true,

        ),
      ],
    );
  }
}
