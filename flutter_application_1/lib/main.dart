import 'package:flutter/material.dart';
import 'telas/tela2.dart'; // Importa o arquivo tela2.dart
import 'telas/tela4.dart'; // Importa o arquivo tela4.dart

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(955, 81, 56, 96)),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Abre o menu
              _openMenu(context);
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            elevation: 20,
            shadowColor: Colors.black,
          ),
          onPressed: () {
            // Mostra um Snackbar quando o botão é pressionado
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Olá, Next Tecnologia!'),
              ),
            );
          },
          child: const Text(
            'Pressione-me',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Função para abrir o menu
  void _openMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Tela2'),
                onTap: () {
                  // Navega para Tela2 quando Tela2 é selecionada
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Tela2()),
                  );
                },
              ),
              ListTile(
                title: const Text('Tela4'),
                onTap: () {
                  // Navega para Tela4 quando Tela4 é selecionada
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Tela4()), // Corrigir aqui
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
