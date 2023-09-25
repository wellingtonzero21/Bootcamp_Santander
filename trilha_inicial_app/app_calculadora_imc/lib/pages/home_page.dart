import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Calculadora de IMC")),
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Container(
              height: 150,
              width: 150,
              color: Color.fromARGB(177, 43, 0, 74),
            ),
          ),
          Container(
            height: 150,
            width: 150,
            color: const Color.fromARGB(177, 43, 0, 74),
          ),
        ],
      ),
    );
  }
}
