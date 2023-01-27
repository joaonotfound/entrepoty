import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

abstract class HttpResponse<T extends Map> {
  T get body;
}

abstract class HttpClient {
  Future<HttpResponse>? get(String url);
}

class LoadCategories {
  final String url;
  final HttpClient httpClient;
  const LoadCategories({
    required this.url,
    required this.httpClient,
  });
  Future<void> load() async {
    httpClient.get(url);
  }
}

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late LoadCategories sut;
  late HttpClient httpClient;
  String url = faker.internet.httpUrl();

  setUp(() {
    httpClient = MockHttpClient();
    sut = LoadCategories(url: url, httpClient: httpClient);
  });
  test("should call httpClient with correct url", () async {
    await sut.load();

    verify(httpClient.get(url)).called(1);
  });
}
