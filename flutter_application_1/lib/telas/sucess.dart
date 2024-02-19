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
              CupertinoIcons.check_mark_circled_solid, //icone
              size: 100.0, // Tamanho do icone
              color: Colors.green, //cor icone
            ),
            SizedBox(height: 20.0), //espaço entre o ícone e o texto
            Text(
              'O Produto será entregue no CEP $cep em 5 dias!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

 
