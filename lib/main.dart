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
  var _perguntaSelecionada = 0;
  var _notaTotal = 0;

  final _perguntas = const [
    {
      'pergunta': 'Qual o seu nome?',
      'respostas': [
        {'texto': 'Danilo', 'nota': 1},
        {'texto': 'Bruno', 'nota': 7},
        {'texto': 'Miguel', 'nota': 5},
        {'texto': 'Lis', 'nota': 10},
      ]
    },
    {
      'pergunta': 'Qual sua idade?',
      'respostas': [
        {'texto': '32', 'nota': 1},
        {'texto': '6', 'nota': 4},
        {'texto': '3', 'nota': 7},
        {'texto': '1 mês', 'nota': 10},
      ]
    },
    {
      'pergunta': 'Qual o seu jogo preferido?',
      'respostas': [
        {'texto': 'Fire emblem', 'nota': 10},
        {'texto': 'Zelda', 'nota': 7},
        {'texto': 'Mario Kart', 'nota': 6},
        {'texto': 'Não jogo', 'nota': 2},
      ]
    },
  ];

  void _responder(int nota) {
    setState(() {
      _perguntaSelecionada++;
      _notaTotal += nota;
    });
    print("Nota: $nota");
    print("NotaTotal: $_notaTotal");
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaTotal = 0;
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
            : Resultado(
                _notaTotal,
                _reiniciar,
              ),
      ),
    );
  }
}
