import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

enum HttpError {
  badRequest,
}

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
  Future load() async {
    var response = await httpClient.get(url);
    if (response?.statuscode == 400) {
      throw HttpError.badRequest;
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
  test("should throw badRequest if status code is equal to 400", () async {
    when(httpClient.get(url)).thenAnswer((_) async {
      return const HttpResponse(statuscode: 400);
    });
    final future = sut.load();

    expect(future, throwsA(HttpError.badRequest));
  });
}
