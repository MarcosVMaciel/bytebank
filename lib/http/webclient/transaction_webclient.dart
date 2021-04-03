import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transacao.dart';
import 'package:http/http.dart';

class TransacaoWebClient {
  Future<Transacao> save(Transacao transacao) async {
    final String transactionJson = jsonEncode(transacao.toJson());
    final Response response = await httpClient.post(baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);

    return Transacao.fromJson(jsonDecode(response.body));
  }

  Future<List<Transacao>> findAll() async {
    final Response response =
        await httpClient.get(baseUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Transacao.fromJson(json)).toList();
  }
}
