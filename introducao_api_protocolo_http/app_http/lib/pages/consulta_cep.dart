import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  String endereco = "";
  String cidade = "";
  String estado = "";

  var cepController = TextEditingController(
    text: "",
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const Text(
                "Consulta de CEP",
                style: TextStyle(fontSize: 25),
              ),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 8,
                controller: cepController,
                onChanged: (String value) {
                  var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cep.length == 8) {
                    cidade = "Cidade";
                    estado = "Estado";
                    endereco = "Endereço";
                  } else {
                    cidade = "";
                    estado = "";
                    endereco = "";
                  }
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                endereco,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "$cidade - $estado",
                style: const TextStyle(fontSize: 20),
              ),
              Container(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var response = await http.get(Uri.parse("https://www.google.com"));
          },
        ),
      ),
    );
  }
}
