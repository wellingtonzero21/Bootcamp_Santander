import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 186, 137),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.person,
                size: 170,
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 40, right: 40),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 248, 248, 248),
                child: const Text("Digite seu e-mail"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 40, right: 40),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 248, 248, 248),
                child: const Text("Digite sua senha"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, left: 40, right: 40),
                width: double.infinity,
                height: 40,
                alignment: Alignment.center,
                color: const Color.fromARGB(255, 42, 168, 77),
                child: const Text("Login"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 40, right: 40),
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text("Cadastre-se"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
