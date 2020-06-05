import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() reiniciar;

  Resultado(this.nota, this.reiniciar);

  String get frasePorNota {
    if (nota < 8) {
      return "Parabéns!!";
    } else if (nota < 12) {
      return "Parabéns!! Você é bom!!";
    } else if (nota < 16) {
      return "Parabéns!! Foi impressionante!!";
    } else {
      return "Parabéns!! Você é um Jedi!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            frasePorNota,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        FlatButton(
          onPressed: reiniciar,
          child: Text(
            "Reiniciar!!",
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue
            ),
          ),
        ),
      ],
    );
  }
}
