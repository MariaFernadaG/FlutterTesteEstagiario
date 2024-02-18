import 'dart:convert';
import 'package:flutter/material.dart';
import 'telas/tela2.dart';
import 'telas/tela3.dart';
import 'telas/tela4.dart';
import 'telas/tela5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple, // Cor AppBar 
          titleTextStyle: TextStyle(color: Colors.white), // cor texto 
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Teste Flutter'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              //abre o menu
              _openMenu(context);
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.purple, //cor de fundo do botão
            elevation: 180,
            shadowColor: Colors.black,
          ),
          onPressed: () {
            //mostra um snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Olá, Next Tecnologia!'),
              ),
            );

            //Tela2
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tela2()),
            );
          },
          child: Icon(
            Icons.store, // icone de loja
            size: 80.0, //tamanho do ícone
            color: Colors.white, 
          ),
        ),
      ),
    );
  }

  //abrir o menu
  void _openMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Nossos Produtos'),
                onTap: () {
                  //tela2 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tela2()),
                    
                  );
                },
              ),
              ListTile(
                title: const Text('Tecnologias'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaProdutosScreen()),
                    
                  );
                },
              ),
              ListTile(
                title: const Text('Consulte seu CEP'),
                onTap: () {
                  //Tela3
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CEPWidget()),
                  );
                },
              ),
              ListTile(
                title: const Text('Cadastre-se'),
                onTap: () {
                  //Tela4
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Tela4()), 
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}