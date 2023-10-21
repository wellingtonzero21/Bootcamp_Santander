import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:primeiro_app/pages/auto_size_text/auto_size_text_page.dart';
import 'package:primeiro_app/pages/parcent_indicator/percent_indicator_page.dart';



class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      InkWell(
        onTap: () {
          showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
            accountEmail: const Text("teste@email.com")),
      ),
      InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.user,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Opção 1",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      const Divider(),
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AutoSizeTextPage(),
              ));
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.textHeight,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Auto Size Text",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      const Divider(),
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PercentIndicatorPage(),
              ));
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.barsProgress,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Indicador de Porcentagem",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      const Divider(),
      InkWell(
        onTap: () {
          
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Intl",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      const Divider(),
      InkWell(
        onTap: () {
          if (context.locale.toString() == "pt_BR") {
            context.setLocale(Locale('en','US'));
          } else {
            context.setLocale(Locale('pt','BR'));
          }
          
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.language,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "pt_BR",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      const Divider(),
      InkWell(
        onTap: () {
          
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.batteryHalf,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Indicador da bateria",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      const Divider(),
    ])));
  }
}
