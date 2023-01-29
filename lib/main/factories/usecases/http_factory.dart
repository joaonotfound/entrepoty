import 'package:service_desk_2/data/http/http_client.dart';
import 'package:mocktail/mocktail.dart';

//todo: implements httpclient
class MockHttpClient extends Mock implements HttpClient {}

HttpClient makeHttpAdapter() {
  return MockHttpClient();
}
