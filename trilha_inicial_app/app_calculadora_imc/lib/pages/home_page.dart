import 'package:flutter/material.dart';
import 'package:primeiro_app/model/calculadora_imc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String situacaoIMC = "";
  double resultadoIMC = 0.0;
  double altura = 1.70;
  double peso = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        title: const Center(
            child: Text(
          "Calculadora de IMC",
          style: TextStyle(fontSize: 20),
        )),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                          max: 2.10,
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
                  String situacao = textoSituacao(resultado);
                  setState(() {
                    print(resultadoIMC);
                    resultadoIMC = resultado;
                    situacaoIMC = situacao;
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
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: Column(
              children: [
                Container(
                  height: 320,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(177, 43, 0, 74),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Resultado:",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          situacaoIMC,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 215, 125),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text(
                          resultadoIMC.toStringAsFixed(
                              2), // Exibe o resultado com duas casas decimais
                          style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
