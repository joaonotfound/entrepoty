import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';

import '../../data.dart';

void main() {
  late RemoteLogin sut;
  final String url = faker.internet.httpUrl();
  late MockHttpClient httpClient;
  String username = faker.internet.userName();
  String password = faker.internet.password();

  void mockPost() => httpClient.mockPost(HttpResponse(
        statuscode: 200,
        body: {
          "token": faker.guid.guid(),
          "username": faker.internet.userName(),
          "name": faker.internet.userName(),
          "profile_url": faker.internet.httpUrl()
        },
      ));

  setUp(() {
    httpClient = MockHttpClient();
    mockPost();
    sut = RemoteLogin(url: url, httpClient: httpClient);
  });
  group("RemoteAuthentication", () {
    test("Should call httpclient with correct values", () async {
      await sut.authenticate(username: username, password: password);
      verify(() => httpClient.post(
          url: url,
          body: {
            "username": username,
            "password": password,
          },
          timeout: Duration(seconds: 2))).called(1);
    });
    test("Should throw invalidCredentials if httpclient throws badrequest",
        () async {
      httpClient.mockPostError(HttpError.badRequest);
      var future = sut.authenticate(username: username, password: password);
      expect(future, throwsA(DomainError.unauthorized));
    });
    test("Should throw invalidCredentials if httpclient throws", () async {
      httpClient.mockPostError(HttpError.badRequest);
      var future = sut.authenticate(username: username, password: password);
      expect(future, throwsA(DomainError.unauthorized));
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
    test("should return invalid credentials exist on 404 error", () async {
      httpClient.mockPost(HttpResponse(statuscode: 404));

      var response = sut.authenticate(username: username, password: password);

      expect(response, throwsA(DomainError.unauthorized));
    });
  });
}
