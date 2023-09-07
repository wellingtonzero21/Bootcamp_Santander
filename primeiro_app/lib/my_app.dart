import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primeiro_app/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.aksharTextTheme(),
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 121, 74, 162)) ,
        ),
      home: const LoginPage(),
    );
  }
}
