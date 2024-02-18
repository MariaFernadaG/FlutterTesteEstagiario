import 'package:flutter/material.dart';
import 'package:flutter_application_1/telas/tela4.dart';

class Tela2 extends StatelessWidget {
  Tela2({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> items = [
    {
      'name': 'Mouse',
      'icon': Icons.mouse,
      'specifications': {'Tipo': 'Óptico', 'Conectividade': 'Sem fio'}
    },
    {
      'name': 'Fone',
      'icon': Icons.headset,
      'specifications': {'Tipo': 'Over-ear', 'Conectividade': 'Com fio'}
    },
    {
      'name': 'Teclado',
      'icon': Icons.keyboard,
      'specifications': {'Tipo': 'Mecânico', 'Conectividade': 'Sem fio'}
    },
    {
      'name': 'Monitor',
      'icon': Icons.monitor,
      'specifications': {'Tamanho': '24 polegadas', 'Resolução': '1080p'}
    },
    {
      'name': 'Processador',
      'icon': Icons.memory,
      'specifications': {'Núcleos': 'Quad-core', 'Velocidade': '3.2 GHz'}
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nossos Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                title: Text(items[index]['name']),
                leading: CircleAvatar(
                   backgroundColor: Colors.transparent,
                  child: Icon(items[index]['icon'], color: Colors.purple),
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
                                  // ir para tela 4
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Tela4()),
                                  );
                                },
                                child: const Text('Comprar'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  onPrimary: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
