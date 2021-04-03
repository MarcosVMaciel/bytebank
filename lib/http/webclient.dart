import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transacao.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client httpClient =
    HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
var baseUrl = Uri.parse('http://192.168.0.104:8080/transactions');

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data.toString());
    return data;
  }
}

Future<Transacao> save(Transacao transacao) async {
  final Map<String, dynamic> transactionMap = {
    'value': transacao.value,
    'contact': {
      'name': transacao.contact.name,
      'accountNumber': transacao.contact.accounteNumber,
    }
  };
  final String transactionJson = jsonEncode(transactionMap);
  final Response response = await httpClient.post(baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'password': '1000',
      },
      body: transactionJson);

  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = json['contact'];
  return Transacao(
      json['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ));
}

Future<List<Transacao>> findAll() async {
  final Response response =
      await httpClient.get(baseUrl).timeout(Duration(seconds: 5));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transacao> transacoes = [];

  for (Map<String, dynamic> element in decodedJson) {
    final Map<String, dynamic> contactJson = element['contact'];
    final Transacao transacao = Transacao(
        element['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ));
    transacoes.add(transacao);
  }
  return transacoes;
}
