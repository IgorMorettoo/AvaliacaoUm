import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _segundaTela(String opcaoUsuario) {
    final random = Random();
    List<String> opcoes = ['pedra', 'papel', 'tesoura'];
    String opcaoMaquina = opcoes[random.nextInt(opcoes.length)];

    Navigator.pushNamed(context, '/segunda',
      arguments: {
        'maquina': opcaoMaquina,
        'usuario': opcaoUsuario,
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,

        title: Text("avaliacaoum"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100),
            Image.asset("images/padrao.png", width: 90, height: 90,),
            const SizedBox(height: 10),
            const Text('Escolha do APP', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),),
            const SizedBox(height: 90),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      child: Image.asset(
                          "images/pedra.png", width: 100, height: 90),
                      onTap: () => _segundaTela("pedra")
                  ),

                  const SizedBox(width: 20),
                  GestureDetector(
                      child: Image.asset(
                          "images/papel.png", width: 100, height: 90),
                      onTap: () => _segundaTela("papel")
                  ),

                  const SizedBox(width: 20),
                  GestureDetector(
                    child: Image.asset(
                        "images/tesoura.png", width: 100, height: 90),
                    onTap: () => _segundaTela("tesoura"),
                  ),

                  const SizedBox(width: 20),
                ]
            )

            //Text(
            // '$_counter',
            //style: Theme.of(context).textTheme.headlineMedium,
            // ),
            // const SizedBox(height: 150),
            //ElevatedButton(onPressed: _incrementCounter, child: Text("Gerar Frase",style: TextStyle(fontSize: 20))),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      //  ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

