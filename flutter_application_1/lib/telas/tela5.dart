import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListaProdutosScreen extends StatefulWidget {
  @override
  _ListaProdutosScreenState createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {
  List<Map<String, dynamic>> products = [];
  int selectedIndex = -1; // Track the index of the selected item

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

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
              setState(() {
                selectedIndex = index; //para poder mudar a cor q clicar
              });
            },
            tileColor: selectedIndex == index ? Colors.purple :null,
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

        print(decodedData);

        if (decodedData is Map && decodedData.containsKey('products')) {
          List<Map<String, dynamic>> allProducts = (decodedData['products'] as List<dynamic>)
              .map((product) => product as Map<String, dynamic>)
              .toList();

          setState(() {
            products = allProducts.take(14).toList();//limita qtd de produtos
          });
        } else {
          throw Exception('Invalido data formato');
        }
      } else {
        throw Exception('falha produtos');
      }
    } catch (error) {
      print('Erro fetching: $error');
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
