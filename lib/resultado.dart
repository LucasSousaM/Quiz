// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarPerguntas;

  const Resultado(this.pontuacao, this.reiniciarPerguntas);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabens';
    } else if (pontuacao < 12) {
      return 'Bom';
    } else if (pontuacao < 16) {
      return 'Impressionante';
    } else {
      return 'Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: reiniciarPerguntas,
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 22,
              color: Colors.amber,
            ),
          ),
        )
      ],
    );
  }
}
