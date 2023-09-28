import 'package:flutter/material.dart';
import 'package:primeiro_app/model/calculadora_imc.dart';
import 'package:primeiro_app/pages/card_resultado.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double altura = 1.70;
  double peso = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
        title: const Center(child: Text("Calculadora de IMC")),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 15,
                  top: 20,
                ),
                height: 200,
                width: 170,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: const Color.fromARGB(177, 43, 0, 74),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                        ),
                        child: Text(
                          "Peso",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      Text(
                        "${peso.toStringAsFixed(0)}kg",
                        style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 30,
                        child: Slider(
                          max: 180,
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 1,
                        ),
                        child: Text(
                          altura.toStringAsFixed(2),
                          style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
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
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(177, 43, 0, 74),
              ),
              child: TextButton(
                onPressed: () {
                    double resultado = calcularIMC(peso, altura);
                    double resultadoIMC() {
                      return resultado;
                    }
                  setState(() {
                    print(resultadoIMC);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Resultado(),));
                  });
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
