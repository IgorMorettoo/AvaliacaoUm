import 'package:flutter/material.dart';

class Segunda extends StatefulWidget {
  const Segunda({super.key});


  @override
  State<Segunda> createState() => _SegundaState();
}
String _resultado(String usuario, String maquina) {
  if (usuario == maquina) {
    return "Empate";
  }
  if ((usuario == "pedra" && maquina == "tesoura") ||
      (usuario == "papel" && maquina == "pedra") ||
      (usuario == "tesoura" && maquina == "papel")) {
    return "Parabéns, você ganhou";
  }
  return "Que pena, você perdeu";
}

class _SegundaState extends State<Segunda> {
  @override

  @override
  Widget build(BuildContext context) {

    final escolhas = ModalRoute.of(context)?.settings.arguments as Map<String, String>? ?? {};
    final String opcaoUsuario = escolhas['usuario'] ?? "pedra";
    final String opcaoMaquina = escolhas['maquina'] ?? "pedra";
    final String resultado = _resultado(opcaoUsuario, opcaoMaquina);
    final String resultadoImagem = (resultado == "Parabéns, você ganhou")
        ? "images/vitoria.png"
        : (resultado == "Que pena, você perdeu!")
        ? "images/perder.png"
        : "images/aperto-de-maos.png";

    return Scaffold (

      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Pedra, Papel, Tesoura"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const SizedBox(height: 10),
            Image.asset('images/$opcaoMaquina.png', width: 120, height: 120),
            const SizedBox(height: 10),
            const Text(
              'Escolha do APP:',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            Image.asset('images/$opcaoUsuario.png', width: 120, height: 120),
            const SizedBox(height: 10),
            const Text(
              'Sua escolha:',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 50),

            Text(
              resultado,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            if (resultadoImagem.isNotEmpty)
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    resultadoImagem,
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              ),
              child: const Text(
                "Jogar Novamente",
                style: TextStyle(color: Colors.white, fontSize: 15),

              ),

            ),
            const SizedBox(height: 20),
          ],

        ),

      ),

    );
  }
}
