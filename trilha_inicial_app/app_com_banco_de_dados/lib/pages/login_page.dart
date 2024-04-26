import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = "";
  var senha = "";
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 23, 24, 31),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 6,
                      child: Image.asset('assets/image/logo_dio.png'),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Já tem cadastro?",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Faça seu login e make the change_",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 40, right: 40),
                  width: double.infinity,
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                      print(email);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 15),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 121, 74, 162)),
                      ),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "E-MAIL",
                      prefixIcon: Icon(Icons.mail,
                          color: Color.fromARGB(255, 121, 74, 162)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  width: double.infinity,
                  child: TextField(
                    obscureText: isObscureText,
                    onChanged: (value) {
                      senha = value;
                      print(senha);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 121, 74, 162)),
                      ),
                      hintStyle: const TextStyle(color: Colors.white),
                      hintText: "SENHA",
                      prefixIcon: const Icon(Icons.lock,
                          color: Color.fromARGB(255, 121, 74, 162)),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color.fromARGB(255, 121, 74, 162)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 121, 74, 162))),
                        onPressed: () {
                          if (email.trim() == "teste@gmail.com" &&
                              senha.trim() == "123456") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Login inválido"),
                            ));
                          }
                        },
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )),
                  ),
                ),
                Expanded(child: Container()),
                const Text(
                  "Esqueci minha senha",
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 231, 201, 109)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: const Text(
                    "Criar conta",
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
