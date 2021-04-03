import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transacao.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

Future<List<Transacao>> findAll() async {
  final Client httpClient =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  var url = Uri.parse('http://192.168.0.104:8080/transactions');
  final Response response = await httpClient.get(url).timeout(Duration(seconds: 5));
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
