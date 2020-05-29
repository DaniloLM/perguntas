import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Pergunta 1?',
      'Pergunta 2?',
      'Pergunta 3?',
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntando'),
          ),
          body: Column(
            children: <Widget>[
              Questao(perguntas[_perguntaSelecionada]),
              Resposta('Resposta 11', _responder),
              Resposta('Resposta 22', _responder),
              Resposta('Resposta 33', _responder),
            ],
          )),
    );
  }
}
