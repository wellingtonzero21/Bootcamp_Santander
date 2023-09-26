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
          Container(
            margin: const EdgeInsets.only(
              left: 14,
              top: 20,
            ),
            height: 200,
            width: 170,
            child: const Card(
              color: Color.fromARGB(177, 43, 0, 74),
              child: Padding(
                padding: EdgeInsets.only(left: 55, top: 50),
                child: Text(
                  "Peso",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
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
                    padding: EdgeInsets.only(left: 1, top: 30,),
                    child: Text(
                      "Altura",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 1,),
                    child: Text(
                      "60",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          print("clicado");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 15,
                          ),
                          child: const Icon(Icons.remove),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          print("clicado");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 25, left: 15),
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
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
