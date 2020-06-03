import 'package:flutter/material.dart';
import 'package:perguntas/questionario.dart';
import 'package:perguntas/resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  final _perguntas = const [
    {
      'pergunta': 'Qual o seu nome?',
      'respostas': ['Danilo', 'Bruno', 'Miguel', 'Lis']
    },
    {
      'pergunta': 'Qual sua idade?',
      'respostas': ['32', '6', '3', '1 mês']
    },
    {
      'pergunta': 'Qual o seu jogo preferido?',
      'respostas': ['Fire emblem', 'Zelda', 'Mario Kart', 'Não jogo']
    },
  ];
  var _perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntando'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(),
      ),
    );
  }
}
