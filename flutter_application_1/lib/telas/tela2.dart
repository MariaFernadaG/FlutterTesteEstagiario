import 'package:flutter/material.dart';
import 'package:flutter_application_1/telas/tela4.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NOSSOS PRODUTOS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(186, 16, 36, 89)),
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
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            elevation: 20,
            shadowColor: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tela2()),
            );
          },
          child: const Text(
            'Go to Tela2',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class Tela2 extends StatelessWidget {
  Tela2({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Mouse',
      'image': 'assets/item1.jpg',
      'icon': Icons.mouse,
      'specifications': {'Tipo': 'Óptico', 'Conectividade': 'Sem fio'}
    },
    {
      'name': 'Fone',
      'image': 'assets/item2.jpg',
      'icon': Icons.headset,
      'specifications': {'Tipo': 'Over-ear', 'Conectividade': 'Com fio'}
    },
    {
      'name': 'Teclado',
      'image': 'assets/item3.jpg',
      'icon': Icons.keyboard,
      'specifications': {'Tipo': 'Mecânico', 'Conectividade': 'Sem fio'}
    },
    {
      'name': 'Monitor',
      'image': 'assets/item4.jpg',
      'icon': Icons.monitor,
      'specifications': {'Tamanho': '24 polegadas', 'Resolução': '1080p'}
    },
    {
      'name': 'Processador',
      'image': 'assets/item5.jpg',
      'icon': Icons.memory,
      'specifications': {'Núcleos': 'Quad-core', 'Velocidade': '3.2 GHz'}
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela2'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]['name']),
            leading: CircleAvatar(
              backgroundImage: AssetImage(items[index]['image']),
              child: Icon(items[index]['icon'], color: Colors.white),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: AlertDialog(
                        title: Text('Especificações de ${items[index]['name']}'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var entry in items[index]['specifications'].entries)
                              Text('${entry.key}: ${entry.value}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Sair'),
                          ),
                          ElevatedButton(
                          onPressed: () {
                            // ir p tela 4 
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Tela4()),
                            );
                          },
                            child: const Text('Comprar'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              onPrimary: Colors.white, // Cor do texto do botão
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
