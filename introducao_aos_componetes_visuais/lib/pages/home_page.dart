import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/brasil_fields_page/brasil_fields_page.dart';
import 'package:primeiro_app/pages/drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    super.initState();
  }

  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "APP_TITLE".tr(),
          ),
      ),
      drawer: const DrawerPage(),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blueGrey,
          ),
          BrasilFieldsPage()
        ],
      ),
      bottomNavigationBar: ConvexAppBar.badge(
        {0: '99+', 2: Colors.redAccent},
        backgroundColor: Colors.black,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.flag, title: 'Brasil'),
        ],
        onTap: (int i) => tabController.index = i,
        controller: tabController,
      ),
    );
  }
}
