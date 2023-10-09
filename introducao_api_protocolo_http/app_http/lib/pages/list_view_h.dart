import 'package:flutter/material.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  elevation: 8,
                  child: Image.asset("assets/image/paisagem1.jpg", height: 100,)),
                Card(
                  elevation: 8,
                  child: Image.asset("assets/image/paisagem2.jpg",height: 100,)),
                Card(
                  elevation: 8,
                  child: Image.asset("assets/image/paisagem3.jpg",height: 100,)),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
          ))
        ],
      ),
    );
  }
}