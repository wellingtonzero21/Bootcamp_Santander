import 'package:flutter/material.dart';
import 'package:primeiro_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTheme extends StatefulWidget {
  const DefaultTheme({super.key});

  @override
  State<DefaultTheme> createState() => _DefaultThemeState();
}

class _DefaultThemeState extends State<DefaultTheme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.aksharTextTheme(),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(177, 43, 0, 74),
        ),
        scaffoldBackgroundColor: Color.fromARGB(163, 17, 0, 43),
      ),
      home: const HomePage(),
    );
  }
}