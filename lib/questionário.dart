import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> pergunta;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    required this.pergunta,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? pergunta[perguntaSelecionada].cast()['respostas']
        : [];
    return Column(
      children: <Widget>[
        //widgets1,
        Questao(pergunta[perguntaSelecionada]['Texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(resp['texto'] as String,
              () => responder(int.parse(resp['pontuacao'].toString())));
        }).toList(),
      ],
    );
  }
}
