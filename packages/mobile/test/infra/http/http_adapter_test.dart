import 'dart:convert';

import 'package:entrepoty/data/data.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class HttpAdapter {
  http.Client client;
  HttpAdapter({
    required this.client,
  });

  @override
  Future<HttpResponse<T>> get<T>({required String url}) async {
    try {
      var response = await client.get(Uri.parse(url));
      return HttpResponse(
        statuscode: response.statusCode,
        body: json.decode(response.body),
      );
    } catch (e) {
      print(e);
      return const HttpResponse(statuscode: 500);
    }
  }

  @override
  Future<HttpResponse> post<T>({required String url, Map? body}) async {
    var response = await client.post(Uri.parse(url), body: body);
    return HttpResponse(
      statuscode: response.statusCode,
      body: json.decode(response.body),
    );
  }
}

class ClientMock extends Mock implements http.Client {
  When mockGetCall() => when(() => get(any()));
  void mockGet(http.Response response) =>
      mockGetCall().thenAnswer((invocation) async => response);
  void mockGetThrows() => mockGetCall().thenThrow(Error());

  When mockPostCall() => when(() => post(any(), body: any(named: "body")));
  void mockPost(http.Response response) =>
      mockPostCall().thenAnswer((invocation) async => response);
  void mockPostThrows() => mockPostCall().thenThrow(Error());
}

void main() {
  late HttpAdapter sut;
  late ClientMock client;
  var url = faker.internet.httpUrl();
  setUpAll(() {
    registerFallbackValue(Uri.parse(url));
  });
  setUp(() {
    client = ClientMock();
    client.mockGet(http.Response("{}", 200));
    client.mockPost(http.Response("{}", 200));
    sut = HttpAdapter(client: client);
  });

  group("HttpAdapter get", () {
    test("should call client with correct url", () async {
      await sut.get(url: url);

      verify(() => client.get(Uri.parse(url))).called(1);
    });
    test("should return correct status code", () async {
      client.mockGet(http.Response("{}", 300));

      var response = await sut.get(url: url);

      expect(response.statuscode, 300);
    });
    test("should return correct body", () async {
      client.mockGet(http.Response("{ \"username\": \"any-username\" }", 200));

      var response = await sut.get(url: url);

      expect(response.body, {"username": "any-username"});
      expect(response.statuscode, 200);
    });
    test("should return 500 error if client throws", () async {
      client.mockGetThrows();

      var response = await sut.get(url: url);

      expect(response.statuscode, 500);
    });
  });
  group("HttpAdapter post", () {
    test("should call client with correct values", () async {
      await sut.post(url: url, body: {"key": "value"});

      verify(() => client.post(Uri.parse(url), body: {"key": "value"}))
          .called(1);
    });
    test("should return correct response", () async {
      client.mockPost(http.Response("{ \"any-key\": \"any-value\"}", 200));

      var response = await sut.post(url: url);

      expect(response.statuscode, 200);
      expect(response.body, {"any-key": "any-value"});
    });
  });
}
