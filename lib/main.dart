import 'package:aulaigor/screens/primeira.dart';
import 'package:aulaigor/screens/segunda.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/': (context) => MyHomePage(title: "Pedra, Papel, Tesoura"),
        '/segunda': (context) => Segunda()
      },
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),

     // home: const MyHomePage(title: 'Frases do dia'),
    );
  }
}

