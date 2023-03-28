import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';

import '../../data.dart';

void main() {
  late RemoteAuthentication sut;
  final String url = faker.internet.httpUrl();
  late MockHttpClient httpClient;
  String username = faker.internet.userName();
  String password = faker.internet.password();

  void mockPost() => httpClient.mockPost(HttpResponse(
        statuscode: 200,
        body: {
          "account": {
            "token": faker.guid.guid(),
            "username": faker.internet.userName(),
            "name": faker.internet.userName(),
            "profile_url": faker.internet.httpUrl()
          }
        },
      ));

  setUp(() {
    httpClient = MockHttpClient();
    mockPost();
    sut = RemoteAuthentication(url: url, httpClient: httpClient);
  });
  group("RemoteAuthentication", () {
    test("Should call httpclient with correct values", () async {
      await sut.authenticate(username: username, password: password);
      verify(() => httpClient.post(url: url, body: {
            "username": username,
            "password": password,
          })).called(1);
    });
    test("Should throw invalidCredentials if httpclient throws badrequest",
        () async {
      httpClient.mockPostError(HttpError.badRequest);
      var future = sut.authenticate(username: username, password: password);
      expect(future, throwsA(DomainError.invalidCredentials));
    });
    test("Should throw invalidCredentials if httpclient throws", () async {
      httpClient.mockPostError(HttpError.badRequest);
      var future = sut.authenticate(username: username, password: password);
      expect(future, throwsA(DomainError.invalidCredentials));
    });
    test("Should throw unexpected if httpclient throws", () async {
      httpClient.mockPostError(HttpError.unexpected);
      var future = sut.authenticate(username: username, password: password);
      expect(future, throwsA(DomainError.unexpected));
    });
    test("Should return account on success", () async {
      var response =
          await sut.authenticate(username: username, password: password);
      expect(response, isInstanceOf<Account>());
    });
  });
}
