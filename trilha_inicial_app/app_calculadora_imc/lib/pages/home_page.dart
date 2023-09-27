import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double altura = 1.50;
  double peso = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Calculadora de IMC")),
      ),
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 15,
              top: 20,
            ),
            height: 200,
            width: 170,
            child: Card(
              color: const Color.fromARGB(177, 43, 0, 74),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 1,
                      top: 30,
                    ),
                    child: Text(
                      "Peso",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 1,
                    ),
                    child: Text(
                      "${peso.toStringAsFixed(0)}kg",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Slider(
                      max: 250,
                      min: 30,
                      value: peso,
                      onChanged: (double value) {
                        setState(() {
                          peso = value;
                          print(peso);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 25,
              top: 20,
            ),
            height: 200,
            width: 170,
            child: Card(
              color: const Color.fromARGB(177, 43, 0, 74),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 1,
                      top: 30,
                    ),
                    child: Text(
                      "Altura",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 1,
                    ),
                    child: Text(
                      "${altura.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Slider(
                      max: 2.50,
                      min: 1.40,
                      value: altura,
                      onChanged: (double value) {
                        setState(() {
                          altura = value;
                          print(altura);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
