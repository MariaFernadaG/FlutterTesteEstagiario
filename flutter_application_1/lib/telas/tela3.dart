import 'package:flutter/material.dart';
import 'package:flutter_application_1/telas/sucess.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CEPWidget extends StatefulWidget {
  @override
  _CEPWidgetState createState() => _CEPWidgetState();
}

class _CEPWidgetState extends State<CEPWidget> {
  final TextEditingController cepController = TextEditingController();
  String? address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar CEP'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: cepController,
                decoration: InputDecoration(labelText: 'CEP'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  fetchAddress(cepController.text);
                },
                child: Text('Consultar Endereço'),
              ),
              SizedBox(height: 20),
              if (address != null)
                Text(
                  'Endereço: $address',
                  style: TextStyle(fontSize: 16),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Sucess(cep: cepController.text),
      ),
    );
  },
                child: Text('Confirmar Endereço'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchAddress(String cep) async {
    final response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        address = 'Rua: ${data['logradouro']}, ${data['bairro']}, ${data['localidade']}-${data['uf']}';
      });
    } else {
      setState(() {
        address = 'Erro ao consultar o CEP';
      });
    }
  }
}

