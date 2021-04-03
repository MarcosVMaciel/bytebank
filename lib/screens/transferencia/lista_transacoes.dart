import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/http/webclient/transaction_webclient.dart';
import 'package:bytebank/models/transacao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaDeTransacoes extends StatelessWidget {
  final TransacaoWebClient _webClient = TransacaoWebClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transações'),
      ),
      body: FutureBuilder<List<Transacao>>(
        future: Future.delayed(Duration(seconds: 1)).then((value) => _webClient.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transacao> transactions = snapshot.data;
                if (transactions.isNotEmpty) {
                  return ListView.builder(
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
                  );
                }
              }
              return CenteredMessage(
                'Nenhuma transação encontrada',
                icon: Icons.warning,
              );
              break;
          }
          return CenteredMessage('Unknown Error');
        },
      ),
    );
  }
}
