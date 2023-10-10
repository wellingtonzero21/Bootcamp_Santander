import 'package:flutter/material.dart';
import 'package:primeiro_app/model/viacep_model.dart';
import 'package:primeiro_app/repositories/via_cep_repository.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  bool loading = false;
  var viacepModel = ViaCEPModel();
  var viaCepRepository = ViaCepRepository();

  var cepController = TextEditingController(
    text: "",
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
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
                  onChanged: (String value) async {
                    var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                    if (cep.length == 8) {
                      setState(() {
                        loading = true;
                      });
                      viacepModel = await viaCepRepository.consultarCEP(cep);
                      setState(() {
                        loading = false;
                      });
                    }
                  }),
              const SizedBox(
                height: 50,
              ),
              Text(
                viacepModel.logradouro ?? "",
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
                style: const TextStyle(fontSize: 20),
              ),
              Visibility(
                  visible: loading, child: const CircularProgressIndicator()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {},
        ),
      ),
    );
  }
}
