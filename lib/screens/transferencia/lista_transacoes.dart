
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaDeTransacoes extends StatelessWidget {
  final List<Transacao> transactions =[];

  @override
  Widget build(BuildContext context) {
    transactions.add(Transacao(100.0, Contact(0, 'Alex', 1000)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transações'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Transacao transaction = transactions[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(
                transaction.value.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transaction.contact.accounteNumber.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

