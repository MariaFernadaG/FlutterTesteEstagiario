import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListaProdutosScreen extends StatefulWidget {
  @override
  _ListaProdutosScreenState createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {
  List<Map<String, dynamic>> products = [];

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Lista de Produtos'),
    ),
    body: ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index]['title'] ?? 'Nome não disponível'),
          onTap: () {
            _showProductDetails(products[index]);
          },
        );
      },
    ),
  );
}


  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        final dynamic decodedData = json.decode(response.body);

        print(decodedData); // Adicione esta linha para imprimir os dados decodificados

        if (decodedData is Map && decodedData.containsKey('products')) {
          setState(() {
            products = (decodedData['products'] as List<dynamic>)
                .map((product) => product as Map<String, dynamic>)
                .toList();
          });
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error fetching products: $error');
     
    }
  }

 void _showProductDetails(Map<String, dynamic> product) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(product['title'] ?? 'Nome não disponível'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${product['id'] ?? 'ID não disponível'}'),
            Text('Price: ${product['price'] ?? 'Preço não disponível'}'),
            // Adicione outras informações conforme necessário
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Fechar'),
          ),
        ],
      );
    },
  );
}
}