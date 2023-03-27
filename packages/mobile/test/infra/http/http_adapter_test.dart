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

  Future<HttpResponse> get({required String url}) async {
    try {
      var response = await client.get(Uri.parse(url));
      return HttpResponse(
        statuscode: response.statusCode,
        body: json.decode(response.body),
      );
    } catch (e) {
      return const HttpResponse(statuscode: 500);
    }
  }
}

class ClientMock extends Mock implements http.Client {
  When mockGetCall() => when(() => get(any()));
  void mockGet(http.Response response) =>
      mockGetCall().thenAnswer((invocation) async => response);
  void mockGetThrows() => mockGetCall().thenThrow(Error());
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
}
