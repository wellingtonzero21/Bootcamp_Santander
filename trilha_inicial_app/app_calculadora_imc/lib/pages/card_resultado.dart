import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/home_page.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key});

  @override
  Widget build(BuildContext context) 
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromARGB(163, 17, 0, 43),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ));
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Resultado:",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              const SizedBox(
                height: 15,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: const Color.fromARGB(177, 43, 0, 74),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 250, horizontal: 170),
                  child: Center(
                    child: Text(""),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
