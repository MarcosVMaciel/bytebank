import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

void findAll() async {
  final Client httpClient = HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  var url = Uri.parse('http://192.168.0.104:8080/transactions');
  final Response response = await httpClient.get(url);
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
