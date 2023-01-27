import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

enum HttpError {
  badRequest,
}

enum DomainError { unexpected }

class HttpResponse<T extends Map> {
  final int statuscode;
  final T? body;
  const HttpResponse({required this.statuscode, this.body});
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
  Future<List> load() async {
    try {
      await httpClient.get(url);
      return ["a"];
    } on HttpError catch (_) {
      return [];
    }
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
  test("should return empty list if httpClient throws", () async {
    when(httpClient.get(url)).thenAnswer((_) async {
      throw HttpError.badRequest;
    });
    final future = await sut.load();

    expect(future, []);
  });
}
