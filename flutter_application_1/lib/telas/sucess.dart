import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Sucess extends StatelessWidget {
  final String cep;

  Sucess({required this.cep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sucesso'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.check_mark_circled_solid, // Ícone de check verde
              size: 100.0, // Tamanho do ícone
              color: Colors.green, // Cor do ícone
            ),
            SizedBox(height: 20.0), // Espaço entre o ícone e o texto
            Text(
              'O Produto será entregue no CEP $cep em 15 dias!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            // Adicione outros widgets conforme necessário
          ],
        ),
      ),
    );
  }
}

 
