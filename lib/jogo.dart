import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");

  var _resultado = "Resultado";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    print(escolhaUsuario);

    print(escolhaApp);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if (escolhaApp == "pedra" && escolhaUsuario == "tesoura") {
      _resultado = "PERDEU";
    } else if (escolhaApp == "pedra" && escolhaUsuario == "papel") {
      _resultado = "GANHOU";
    } else if (escolhaApp == "pedra" && escolhaUsuario == "pedra") {
      _resultado = "EMPATOU";
    } else if (escolhaApp == "tesoura" && escolhaUsuario == "papel") {
      _resultado = "PERDEU";
    } else if (escolhaApp == "tesoura" && escolhaUsuario == "pedra") {
      _resultado = "GANHOU";
    } else if (escolhaApp == "tesoura" && escolhaUsuario == "tesoura") {
      _resultado = "EMPATOU";
    } else if (escolhaApp == "papel" && escolhaUsuario == "pedra") {
      _resultado = "PERDEU";
    } else if (escolhaApp == "papel" && escolhaUsuario == "tesoura") {
      _resultado = "GANHOU";
    } else if (escolhaApp == "papel" && escolhaUsuario == "papel") {
      _resultado = "EMPATOU";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // text
          // imagem
          // text resultado
          // Linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: _imagemApp,
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._resultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
