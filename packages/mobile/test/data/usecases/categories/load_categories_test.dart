import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';

import '../../mocks/mocks.dart';

void main() {
  late LoadCategories sut;
  late MockHttpClient httpClient;
  String url = faker.internet.httpUrl();

  setUp(() {
    httpClient = MockHttpClient();
    httpClient.mockGet(const HttpResponse(statuscode: 200));
    sut = LoadCategories(url: url, httpClient: httpClient);
  });
  group("LoadCategories", () {
    test("should call httpClient with correct url", () async {
      await sut.load();
      verify(() => httpClient.get(url: url)).called(1);
    });

    test("should return empty list if httpClient throws", () async {
      httpClient.mockGetError(HttpError.badRequest);

      final future = await sut.load();

      expect(future, []);
    });

    test("should return categories on sucess", () async {
      httpClient.mockGet(const HttpResponse(
        statuscode: 200,
        body: {
          "categories": [
            {"name": "first-category", "models": []}
          ]
        },
      ));

      var response = await sut.load();
      expect(response, isInstanceOf<List<CategoryEntity>>());
    });
  });
}
