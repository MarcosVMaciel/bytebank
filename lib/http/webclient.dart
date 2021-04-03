
import 'package:bytebank/http/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client httpClient =
    HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
var baseUrl = Uri.parse('http://192.168.0.104:8080/transactions');

