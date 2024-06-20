import 'package:flutter/material.dart';
import './resultado.dart';
import './questionário.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final _pergunta = const [
    {
      'Texto': 'Qual sua coloração favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Branco', 'pontuacao': 5},
        {'texto': 'Azul', 'pontuacao': 3},
        {'texto': 'Verde', 'pontuacao': 1},
      ]
    },
    {
      'Texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Tatu', 'pontuacao': 3},
        {'texto': 'Anta', 'pontuacao': 1},
      ]
    },
    {
      'Texto': 'Qual seu professor favorito?',
      'respostas': [
        {'texto': 'Tiago', 'pontuacao': 10},
        {'texto': 'Leo', 'pontuacao': 5},
        {'texto': 'Maria', 'pontuacao': 3},
        {'texto': 'João', 'pontuacao': 1},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarPerguntas() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                pergunta: _pergunta,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarPerguntas),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() => _PerguntaAppState();
}
